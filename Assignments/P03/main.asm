    MOV CL,7
    MOV CH,0FH
    MOV DL, 0
L2: CMP CL,CH
    JG L1
    ADD DL, CL
    ADD CL, 1
    JMP L2
L1: SHR DL,1