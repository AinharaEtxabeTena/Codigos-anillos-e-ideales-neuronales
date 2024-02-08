︠7b8af72f-9d18-463a-8e4d-1da5b17f2666s︠
def forma_canonica(n,m,codigo):
    """
    Una función que toma dos números enteros y una lista de vectores como entrada, y devuelve la forma canónica del código.

    Input:
        n (int): Número de neuronas.
        m (int): Número de pàlabras código.
        codigo (list): Lista de vectores que forman el código.

    Return:
        list: Lista de polinomios factorizados que forman la forma canónica del ideal neuronal.
    """
    GF2 = FiniteField(2)

    #Se verifica que todos los datos de entrada son correctos

    if not len(codigo)==m:
        print("El número de palabras código de entrada no coincide con", m)
        return
    for i in range(len(codigo)):
        if not len(codigo[i])==n:
            print("La longitud de alguna de las palabras de entrada no coincide con", n)
            return
    for i in range(m):
        for j in range(n):
            if not (codigo[i][j]==0 or codigo[i][j]==1):
                print("Alguna de las palabras de entrada no es un patron binario.")
                return


    M=MatrixSpace(GF2, m, n)
    R = PolynomialRing(GF2, ['x%s'%i for i in range(1,n+1)])
    C = M(codigo)  #Matriz compuesta por las palabras código en filas
    ci = vector(R, C[0]) #Palabra c1
    CF_JCi = [R.gen(j)-ci[j] for j in range(n)] # PASO 1
    i = 1
    while i < m:
        i = i + 1
        Mi = [f * (R.gen(j)- vector(GF2,C[i-1])[j]) for j in range(n)for f in CF_JCi] # PASO 2
        S=[R.gen(j)^2-R.gen(j) for j in range (n)]
        A=[R.gen(j)^2  for j in range(n)]
        B=[(R.gen(k)-1)^2 for k in range(n)]
        Mi_prima1=[]
        #PASO 3
        for f in Mi:
            es_nulo = False
            for g in S:
                if g.divides(f):
                    Mi_prima1.append(0)
                    es_nulo = True
                    break  # Salir del bucle interno si encontramos un g que divide f
            if not es_nulo:
                Mi_prima1.append(f)
        Mi_prima2=[f for f in Mi_prima1 if  f !=0 ]
        Mi_prima=[]
        for f in Mi_prima2:
            divisible_por_g = False
            for g in A + B:
                if g.divides(f):
                    Mi_prima.append(f//sqrt(g))
                    divisible_por_g = True
                    break  # Salir del bucle interno si encontramos un g que divide f
            if not divisible_por_g:
                Mi_prima.append(f)
        Mi_tilde=list(set([f for f in Mi_prima if not any(g.divides(f) for g in Mi_prima if f!=g)]))#PASO 4
        CF_JCi=Mi_tilde #vuelta al PASO 2
    formacanonica=[CF_JCi[i].factor() for i in range(len(CF_JCi))]
    return print("La forma canónica de ideal neuronal es",formacanonica)
︡295f0441-501e-4139-860a-ad6a2c34519b︡{"done":true}
︠e29478d8-20b0-4823-8455-c6e37f7e6be9s︠
A1=[[0,0,0],[1,0,0],[0,1,0],[0,0,1],[1,1,0],[1,0,1],[0,1,1],[1,1,1]]
A2=[[0,0,0],[1,0,0],[0,1,0],[1,1,0],[1,0,1],[1,1,1]]
A3=[[0,0,0],[1,0,0],[0,1,0],[0,0,1],[1,1,0],[1,0,1],[1,1,1]]
A4=[[0,0,0],[1,0,0],[0,1,0],[1,1,0],[1,0,1],[0,1,1],[1,1,1]]
A5=[[0,0,0],[1,0,0],[0,1,0],[1,1,0],[1,1,1]]
A6=[[0,0,0],[1,0,0],[1,1,0],[1,0,1],[1,1,1]]
A7=[[0,0,0],[1,0,0],[0,1,0],[1,0,1],[1,1,1]]
A8=[[0,0,0],[1,0,0],[0,1,0],[0,0,1],[1,1,0],[1,1,1]]
A9=[[0,0,0],[1,0,0],[0,0,1],[1,1,0],[0,1,1],[1,1,1]]
A10=[[0,0,0],[1,0,0],[0,1,0],[1,0,1],[0,1,1],[1,1,1]]
A11=[[0,0,0],[1,0,0],[1,1,0],[1,0,1],[0,1,1],[1,1,1]]
A12=[[0,0,0],[1,0,0],[1,1,0],[1,1,1]]
A13=[[0,0,0],[1,0,0],[0,1,0],[1,1,1]]
A14=[[0,0,0],[1,0,0],[0,1,0],[0,0,1],[1,1,1]]
A15=[[0,0,0],[1,1,0],[1,0,1],[0,1,1],[1,1,1]]
A16=[[0,0,0],[1,0,0],[0,1,1],[1,1,1]]
A17=[[0,0,0],[1,1,0],[1,0,1],[1,1,1]]
A18=[[0,0,0],[1,0,0],[1,1,1]]
A19=[[0,0,0],[1,1,0],[1,1,1]]
A20=[[0,0,0],[1,1,1]]
B1=[[0,0,0],[1,0,0],[0,1,0],[0,0,1],[1,1,0],[1,0,1]]
B2=[[0,0,0],[1,0,0],[0,1,0],[1,1,0],[1,0,1]]
B3=[[0,0,0],[1,0,0],[0,1,0],[1,0,1],[0,1,1]]
B4=[[0,0,0],[1,0,0],[1,1,0],[1,0,1]]
B5=[[0,0,0],[1,0,0],[1,1,0],[0,1,1]]
B6=[[0,0,0],[1,1,0],[1,0,1]]
C1=[[0,0,0],[1,0,0],[0,1,0],[0,0,1],[1,1,0]]
C2=[[0,0,0],[1,0,0],[0,1,0],[1,0,1]]
C3=[[0,0,0],[1,0,0],[0,1,1]]
D=[[0,0,0],[1,0,0],[0,1,0],[0,0,1]]
E1=[[0,0,0],[1,0,0],[0,1,0],[0,0,1],[1,1,0],[1,0,1],[0,1,1]]
E2=[[0,0,0],[1,0,0],[0,1,0],[1,1,0],[1,0,1],[0,1,1]]
E3=[[0,0,0],[1,0,0],[1,1,0],[1,0,1],[0,1,1]]
E4=[[0,0,0],[1,1,0],[0,1,1],[1,0,1]]
F1=[[0,0,0],[1,0,0],[0,1,0],[1,1,0]]
F2=[[0,0,0],[1,0,0],[1,1,0]]
F3=[[0,0,0],[1,1,0]]
G1=[[0,0,0],[1,0,0]]
H1=[[0,0,0]]
I1=[[0,0,0],[1,0,0],[0,1,0]]
︡05918b89-b365-489d-b7b2-341c326f510f︡{"done":true}
︠e588770f-5ec5-4664-8daf-fc75a28835f9s︠
forma_canonica(3,8,A1)
︡5ace468a-b7d9-4b10-bfe9-3887af9adee5︡{"stdout":"La forma canónica de ideal neuronal es"}︡{"stdout":" []\n"}︡{"done":true}
︠d6da3b45-5cf9-454b-9177-42a2e57dbcccs︠
forma_canonica(3,6,A2)
︡eea7ef32-e5d6-43b3-9c98-21a3f553c272︡{"stdout":"La forma canónica de ideal neuronal es [x3 * (x1 + 1)]\n"}︡{"done":true}
︠58a0709a-5c96-46e4-a036-a1c617dede23s︠
forma_canonica(3,7,A3)
︡3514dbba-c875-4ac1-acac-6a04f748bb1d︡{"stdout":"La forma canónica de ideal neuronal es [x3 * x2 * (x1 + 1)]\n"}︡{"done":true}
︠62e14ada-5d2e-4044-a16c-200db83e6679s︠
forma_canonica(3,7,A4)
︡a9aca600-f9d5-40f5-95e3-cca21ffe9326︡{"stdout":"La forma canónica de ideal neuronal es [x3 * (x2 + 1) * (x1 + 1)]\n"}︡{"done":true}
︠dcd69928-7cc0-413d-bf2e-36b1f77af8acs︠
forma_canonica(3,5,A5)
︡e60559f1-1fd3-4056-87a8-d828a21883d5︡{"stdout":"La forma canónica de ideal neuronal es [x3 * (x2 + 1), x3 * (x1 + 1)]\n"}︡{"done":true}
︠fe167c51-910e-4fd5-a245-32781e4993fcs︠
forma_canonica(3,5,A6)
︡0623aed7-84b3-49f8-8fd5-42bb26b30ae1︡{"stdout":"La forma canónica de ideal neuronal es [x2 * (x1 + 1), x3 * (x1 + 1)]\n"}︡{"done":true}
︠fd0d9691-49d4-4f4d-8f8d-111ea3ed2b69s︠
forma_canonica(3,5,A7)
︡ee3a1cc4-0bb0-4eda-b0d0-a9d2dee6f2f8︡{"stdout":"La forma canónica de ideal neuronal es [(x3 + 1) * x2 * x1, x3 * (x1 + 1)]\n"}︡{"done":true}
︠f5d539c0-12d8-47e6-8f3b-9f11269030a0s︠
forma_canonica(3,6,A8)
︡33fde051-70fe-43a6-a04d-c9baf7393ca9︡{"stdout":"La forma canónica de ideal neuronal es [x3 * (x2 + 1) * x1, x3 * x2 * (x1 + 1)]\n"}︡{"done":true}
︠5e2278c3-8555-4501-b108-ce40dd5dc512s︠
forma_canonica(3,6,A9)
︡9b58eed1-e2db-4d9c-93ba-10a679e70311︡{"stdout":"La forma canónica de ideal neuronal es [x3 * (x2 + 1) * x1, (x3 + 1) * x2 * (x1 + 1)]\n"}︡{"done":true}
︠1760c4a7-a61f-44da-8577-86af5482d19es︠
forma_canonica(3,6,A10)
︡5b7e0f51-fad9-4fdb-a50d-afbfb9cda231︡{"stdout":"La forma canónica de ideal neuronal es [(x3 + 1) * x2 * x1, x3 * (x2 + 1) * (x1 + 1)]\n"}︡{"done":true}
︠073ea124-df0d-4282-a50c-ea9c00e1645fs︠
forma_canonica(3,6,A11)
︡7d9037f1-4686-461d-94b8-2ad8086e4683︡{"stdout":"La forma canónica de ideal neuronal es [(x3 + 1) * x2 * (x1 + 1), x3 * (x2 + 1) * (x1 + 1)]\n"}︡{"done":true}
︠1222b4d0-544e-4526-adac-9fdff4adbdc9s︠
forma_canonica(3,4,A12)
︡0c34f4b5-afa5-441a-be21-587c0a6963ad︡{"stdout":"La forma canónica de ideal neuronal es [x2 * (x1 + 1), x3 * (x2 + 1), x3 * (x1 + 1)]\n"}︡{"done":true}
︠e5a7ff48-6254-41e5-bcd4-431cea497611s︠
forma_canonica(3,4,A13)
︡b9511a9d-dad5-4b4e-a13c-192432d9962c︡{"stdout":"La forma canónica de ideal neuronal es [(x3 + 1) * x2 * x1, x3 * (x2 + 1), x3 * (x1 + 1)]\n"}︡{"done":true}
︠9b6de513-b103-4ce2-a7d5-114ca1d79370s︠
forma_canonica(3,5,A14)
︡de1400b1-2ef1-49f3-a002-69a8f42c46e5︡{"stdout":"La forma canónica de ideal neuronal es [x3 * (x2 + 1) * x1, (x3 + 1) * x2 * x1, x3 * x2 * (x1 + 1)]\n"}︡{"done":true}
︠b394e9a7-3fef-4d78-8524-038449e8ca1as︠
forma_canonica(3,5,A15)
︡e403ae93-cd43-44eb-8eab-7c1e761e15dc︡{"stdout":"La forma canónica de ideal neuronal es [(x3 + 1) * (x2 + 1) * x1, (x3 + 1) * x2 * (x1 + 1), x3 * (x2 + 1) * (x1 + 1)]\n"}︡{"done":true}
︠54344d9f-8fb4-4d0f-bfac-a5209adb66ffs︠
forma_canonica(3,4,A16)
︡5ea3f4dc-87bb-4301-93cd-b999442c05ee︡{"stdout":"La forma canónica de ideal neuronal es [(x3 + 1) * x2, x3 * (x2 + 1)]\n"}︡{"done":true}
︠0ef3d688-751f-49a3-bc0c-6194accfb4bbs︠
forma_canonica(3,4,A17)
︡fee3490b-c49a-4af8-9626-1735086901a0︡{"stdout":"La forma canónica de ideal neuronal es [(x3 + 1) * (x2 + 1) * x1, x2 * (x1 + 1), x3 * (x1 + 1)]\n"}︡{"done":true}
︠9696900c-4cfc-4f4c-a0c0-944788c95396s︠
forma_canonica(3,3,A18)
︡17d53bac-eeb9-4c08-a938-4c7ef8b3d3a7︡{"stdout":"La forma canónica de ideal neuronal es [(x3 + 1) * x2, x2 * (x1 + 1), x3 * (x2 + 1), x3 * (x1 + 1)]\n"}︡{"done":true}
︠5f03b207-beb7-45b4-856f-2dbde917709es︠
forma_canonica(3,3,A19)
︡026bc9aa-6a29-43c3-b036-b33afc64e1f7︡{"stdout":"La forma canónica de ideal neuronal es [(x2 + 1) * x1, x2 * (x1 + 1), x3 * (x2 + 1), x3 * (x1 + 1)]\n"}︡{"done":true}
︠c9660d09-0415-4192-9a40-ee0447e3783fs︠
forma_canonica(3,2,A20)
︡320b6195-131b-4514-9173-3d2222d4d92b︡{"stdout":"La forma canónica de ideal neuronal es [(x3 + 1) * x1, (x3 + 1) * x2, x3 * (x2 + 1), x3 * (x1 + 1), (x2 + 1) * x1, x2 * (x1 + 1)]\n"}︡{"done":true}
︠14795ae0-357e-422c-980a-97489b6825dfs︠
forma_canonica(3,6,B1)
︡430b9024-9f78-418a-ae44-64756e507925︡{"stdout":"La forma canónica de ideal neuronal es [x3 * x2]\n"}︡{"done":true}
︠41970f99-c221-434f-b3a5-88e8ca515aa2s︠
forma_canonica(3,5,B2)
︡fb872f40-2759-415b-91ee-dfc735456646︡{"stdout":"La forma canónica de ideal neuronal es [x3 * x2, x3 * (x1 + 1)]\n"}︡{"done":true}
︠47165bb3-4dbb-4ab7-b0bf-1e64a768c05cs︠
forma_canonica(3,5,B3)
︡35dcdb4c-aa07-4bfb-95d9-e638f62db54b︡{"stdout":"La forma canónica de ideal neuronal es [x3 * (x2 + 1) * (x1 + 1), x2 * x1]\n"}︡{"done":true}
︠48b8ceb2-abe1-4a61-bf2d-6f8097da767as︠
forma_canonica(3,4,B4)
︡16682934-c3ea-4bad-bb3f-426865b295d7︡{"stdout":"La forma canónica de ideal neuronal es [x2 * (x1 + 1), x3 * x2, x3 * (x1 + 1)]\n"}︡{"done":true}
︠7380c6df-2999-4485-9c83-6c7759d63802s︠
forma_canonica(3,4,B5)
︡92f5c0c6-1478-44b2-be1b-f362a8a186e2︡{"stdout":"La forma canónica de ideal neuronal es [(x3 + 1) * x2 * (x1 + 1), x3 * (x2 + 1), x3 * x1]\n"}︡{"done":true}
︠5258aae4-125c-4c78-be15-675a31beb1ees︠
forma_canonica(3,3,B6)
︡e3f61e5a-9f50-484f-9590-610a2686df00︡{"stdout":"La forma canónica de ideal neuronal es [(x3 + 1) * (x2 + 1) * x1, x2 * (x1 + 1), x3 * x2, x3 * (x1 + 1)]\n"}︡{"done":true}
︠f414c898-b464-4b82-97f4-d476de4ee4b9s︠
forma_canonica(3,5,C1)
︡c2006dc6-1f10-4020-800d-a9d9d643a42e︡{"stdout":"La forma canónica de ideal neuronal es [x3 * x2, x3 * x1]\n"}︡{"done":true}
︠e1b4f83e-3c5f-4e8b-85f1-ee36e9a25e7bs︠
forma_canonica(3,4,C2)
︡a9ced9e4-f49c-4b61-8c5e-e8d211579921︡{"stdout":"La forma canónica de ideal neuronal es [x2 * x1, x3 * x2, x3 * (x1 + 1)]\n"}︡{"done":true}
︠68c4b61b-c7c5-4962-a7a3-3f5f3972a5f7s︠
forma_canonica(3,3,C3)
︡9f954669-dfb9-430e-aeac-b9d39ee85df7︡{"stdout":"La forma canónica de ideal neuronal es [(x3 + 1) * x2, x3 * (x2 + 1), x3 * x1, x2 * x1]\n"}︡{"done":true}
︠40fa1796-7a25-4ed0-a92d-2445612b7bd2s︠
forma_canonica(3,4,D)
︡5db21f3b-9930-4600-a713-8acf833dd2f7︡{"stdout":"La forma canónica de ideal neuronal es [x3 * x2, x3 * x1, x2 * x1]\n"}︡{"done":true}
︠44fcf8b8-ea88-475f-8496-7b65eff22e47s︠
forma_canonica(3,7,E1)
︡8fa532b3-1d1e-4743-80e2-fd1011480d1d︡{"stdout":"La forma canónica de ideal neuronal es [x3 * x2 * x1]\n"}︡{"done":true}
︠a70ee35a-4a88-4f42-971b-a36904d5824ds︠
forma_canonica(3,6,E2)
︡10be47c9-ff31-4129-abbf-0ba90f08ff78︡{"stdout":"La forma canónica de ideal neuronal es [x3 * x2 * x1, x3 * (x2 + 1) * (x1 + 1)]\n"}︡{"done":true}
︠7d9eaa44-47be-43e5-be9e-b3d2626285b0s︠
forma_canonica(3,5,E3)
︡455d2119-0d83-4ddb-a461-41f83478e07e︡{"stdout":"La forma canónica de ideal neuronal es [(x3 + 1) * x2 * (x1 + 1), x3 * x2 * x1, x3 * (x2 + 1) * (x1 + 1)]\n"}︡{"done":true}
︠170dd769-3a2a-47f6-a941-cd5cba846602s︠
forma_canonica(3,4,E4)
︡2da2a7cf-772a-4549-bd99-a442f04512d9︡{"stdout":"La forma canónica de ideal neuronal es [(x3 + 1) * (x2 + 1) * x1, (x3 + 1) * x2 * (x1 + 1), x3 * x2 * x1, x3 * (x2 + 1) * (x1 + 1)]\n"}︡{"done":true}
︠cb4b721c-fbe8-437c-8959-4fc88e8b0dc9s︠
forma_canonica(3,4,F1)
︡85389dbf-fbce-4393-bb95-c9853cc6f974︡{"stdout":"La forma canónica de ideal neuronal es [x3]\n"}︡{"done":true}
︠35c33a6c-e049-4c8d-bd27-adf719ff2feas︠
forma_canonica(3,3,F2)
︡799f32ca-c008-46f8-bef5-c5783fc3670a︡{"stdout":"La forma canónica de ideal neuronal es [x3, x2 * (x1 + 1)]\n"}︡{"done":true}
︠1d9420b8-31ad-4154-8d6a-9534b2504afes︠
forma_canonica(3,2,F3)
︡ca17029d-dfe6-42b6-896a-e0f513b7eb69︡{"stdout":"La forma canónica de ideal neuronal es [(x2 + 1) * x1, x2 * (x1 + 1), x3]\n"}︡{"done":true}
︠03d1c230-0ebc-4cc9-966c-617cde55dc57s︠
forma_canonica(3,2,G1)
︡4035295c-7205-4e6f-ac21-80c145f8420e︡{"stdout":"La forma canónica de ideal neuronal es [x3, x2]\n"}︡{"done":true}
︠19db60dd-bc0a-4c8b-bef8-f011c2c98ee4s︠
forma_canonica(3,1,H1)
︡49816425-3a05-4864-8e81-e36e09c1b983︡{"stdout":"La forma canónica de ideal neuronal es [x1, x2, x3]\n"}︡{"done":true}
︠13540840-1d44-4d25-9fb3-e24c22b6f0b9s︠
forma_canonica(3,3,I1)
︡c9abd4cd-f1cf-4bad-956b-1e6218079ac6︡{"stdout":"La forma canónica de ideal neuronal es [x3, x2 * x1]\n"}︡{"done":true}
︠d674f406-bd4b-4d07-97a9-abb00b8f81f1︠









