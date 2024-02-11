" Author:   Saleem Abdulrasool <compnerd@compnerd.org>
" Homepage: http://github.com/compnerd/arm64asm
" License:  Redistribute under the same terms as Vim itself

if version < 600
  syn clear
elseif exists("b:current_syn")
  finish
endif

" NOTE(compnerd) '.' is not in the default keyword, and will cause the
" directives to not be recognised by default.  Also add '!' to ensure that the
" increment operator is matched.
if version < 600
  set iskeyword=!,#,$,%,.,48-57,:,;,=,@,_
else
  setlocal iskeyword=!,#,$,.,48-57,:,;,=,@,_
endif

" syn case match

syn keyword AArch64Special NOTE TODO XXX contained

syn case ignore

syn region AArch64Comment start="//" end="$" keepend contains=AArch64Special
syn region AArch64Comment start="/\*" end="\*/" contains=AArch64Special
" MachO uses ; as a comment leader
syn region AArch64Comment start=";" end="$" contains=todo

syn match asmx86Directive       "\.[a-z_]\+\w*\>"
syn keyword AArch64Directive .align .p2align .global .globl .type
syn keyword AArch64Directive .hword .word .xword .long .quad
syn keyword AArch64Directive .loh
syn keyword AArch64Directive .tlsdesccall
syn keyword AArch64Directive .ltorg .pool
syn keyword AArch64Directive .req .unreq
syn keyword AArch64Directive .inst
syn keyword AArch64Directive .private_extern .extern
syn keyword AArch64Directive .section .text .data
syn keyword AArch64Directive .def .endef .scl
syn keyword AArch64Directive .macro .endmacro .endm
syn keyword AArch64Directive .set
syn keyword AArch64Directive .if .else .endif
syn keyword AArch64Directive .fill

 " NOTE(compnerd) .type is already listed above

syn match AArch64Modifier /:lo12:/ contained
syn match AArch64Modifier /:abs_g3:/ contained
syn match AArch64Modifier /:abs_g2:/ contained
syn match AArch64Modifier /:abs_g2_s:/ contained
syn match AArch64Modifier /:abs_g2_nc:/ contained
syn match AArch64Modifier /:abs_g1:/ contained
syn match AArch64Modifier /:abs_g1_s:/ contained
syn match AArch64Modifier /:abs_g1_nc:/ contained
syn match AArch64Modifier /:abs_g0:/ contained
syn match AArch64Modifier /:abs_g0_s:/ contained
syn match AArch64Modifier /:abs_g0_nc:/ contained
syn match AArch64Modifier /:dtprel_g2:/ contained
syn match AArch64Modifier /:dtprel_g1:/ contained
syn match AArch64Modifier /:dtprel_g1_nc:/ contained
syn match AArch64Modifier /:dtprel_g0:/ contained
syn match AArch64Modifier /:dtprel_g0_nc:/ contained
syn match AArch64Modifier /:dtprel_hi12:/ contained
syn match AArch64Modifier /:dtprel_lo12:/ contained
syn match AArch64Modifier /:dtprel_lo12_nc:/ contained
syn match AArch64Modifier /:tprel_g2:/ contained
syn match AArch64Modifier /:tprel_g1:/ contained
syn match AArch64Modifier /:tprel_g1_nc:/ contained
syn match AArch64Modifier /:tprel_g0:/ contained
syn match AArch64Modifier /:tprel_g0_nc:/ contained
syn match AArch64Modifier /:tprel_hi12:/ contained
syn match AArch64Modifier /:tprel_lo12:/ contained
syn match AArch64Modifier /:tprel_lo12_nc:/ contained
syn match AArch64Modifier /:tlsdesc:/ contained
syn match AArch64Modifier /:tlsdesc_lo12:/ contained
syn match AArch64Modifier /:got:/ contained
syn match AArch64Modifier /:got_lo12:/ contained
syn match AArch64Modifier /:gottprel:/ contained
syn match AArch64Modifier /:gottprel_lo12:/ contained
syn match AArch64Modifier /:gottprel_g1:/ contained
syn match AArch64Modifier /:gottprel_g0_nc:/ contained

syn match AArch64Modifier /@PAGE/ contained
syn match AArch64Modifier /@PAGEOFF/ contained

syn match AArch64Identifier /[-_$.A-Za-z0-9]\+/
syn match AArch64Identifier /:.*:[-_$.A-Za-z0-9]\+/ contains=AArch64Modifier
" MachO uses @modifiers
syn match AArch64Identifier /[-_$.A-Za-z0-9]\+@[a-zA-Z]\+/ contains=AArch64Modifier
" MachO uses L for the PrivateGloablPrefix, ELF uses .L
syn match AArch64Identifier /\.\?L[-_$.A-Za-z0-9]\+/ contains=AArch64Modifier
syn match AArch64Identifier /:.*:\.\?L[-_$.A-Za-z0-9]\+/ contains=AArch64Modifier
" MachO uses @modifiers
syn match AArch64Identifier /\.\?L[-_$.A-Za-z0-9]\+[a-zA-Z]\+/ contains=AArch64Modifier

syn match AArch64Label /^[-_$.A-Za-z0-9]\+\s*:/
" MachO uses L for the PrivateGloablPrefix, ELF uses .L
syn match AArch64Label /^\.\?L[-_$.A-Za-z0-9]\+\s*:/
syn match AArch64Label /^"[-_$.A-Za-z0-9 ]\+\s*":/

syn keyword AArch64Mnemonic ADC ADCS ADD ADDS ADR ADRP AND ANDS ASR ASRV AT

syn keyword AArch64Mnemonic BEQ BNE BCS BHS BCC BLO BMI BPL BVS BVC BHI BLS
syn keyword AArch64Mnemonic BGE BLT BGT BLE BAL BNV
syn keyword AArch64Mnemonic B.EQ B.NE B.CS B.HS B.CC B.LO B.MI B.PL B.VS B.VC
syn keyword AArch64Mnemonic B.HI B.LS B.GE B.LT B.GT B.LE B.AL B.NV
syn keyword AArch64Mnemonic B BFI BFM BFXIL BIC BICS BL BLR BR BRK

syn keyword AArch64Mnemonic CBNZ CBZ CCMN CINC CINV CLREX CLS CLZ CMN CMP
syn keyword AArch64Mnemonic CNEG CRC32B CRC32H CRC32W CRC32X CRC32CB CRC32CH
syn keyword AArch64Mnemonic CRC32CW CRC32CX
syn keyword AArch64Mnemonic CSEL CSET CSINC CSINV CSNEG

syn keyword AArch64Mnemonic DC DCPS1 DCPS2 DCP3 DMB DRPS DSB

syn keyword AArch64Mnemonic EON EOR ERET EXTR

syn keyword AArch64Mnemonic HINT HLT HVC

syn keyword AArch64Mnemonic IC ISB

syn keyword AArch64Mnemonic LDAR LDARB LDARH LDAXP LDAXR LDAXRB LDAXRH LDNP
syn keyword AArch64Mnemonic LDP LDPSW LDR LDRB LDRH LDRSH LDRSW LDTR LDTRB
syn keyword AArch64Mnemonic LDTRH LDTRSB LDTRSH LDTRSW LDUR LDURB LDURH
syn keyword AArch64Mnemonic LDURSB LDURSH LDURSW LDXP LDXR LDXRB LDXRH LSL
syn keyword AArch64Mnemonic LSLV LSR LSRV

syn keyword AArch64Mnemonic MADD MNEG MOV MOVK MOVN MOVZ MRS MSUB MUL MVN

syn keyword AArch64Mnemonic NEGS NGC NGCS NOP

syn keyword AArch64Mnemonic ORN ORR

syn keyword AArch64Mnemonic PRFM PRFUM

syn keyword AArch64Mnemonic RBIT RET REV REV16 REV32 ROR RORV

syn keyword AArch64Mnemonic SBC SBCS SBFIZ SBFM SBFX SDIV SEV SEVL SMADDL
syn keyword AArch64Mnemonic SMC SMNEGL SMSUBL SMULH SMULL STLR STLRB STLRH
syn keyword AArch64Mnemonic STLXP STLXR STLXRB STLXRH XTNP STP STR STRB STRH
syn keyword AArch64Mnemonic STTTR STTRB STTRH STUR STURB STURH STXP STXR
syn keyword AArch64Mnemonic STXRB STXRH SUB SUBS SVC SXTB SXTH SXTW SYS SYSL

syn keyword AArch64Mnemonic TBNZ TBZ TLBI TST

syn keyword AArch64Mnemonic UBFIZ UBFM UBFX UDIV UMADDL UMNEGL UMSUBL UMULH
syn keyword AArch64Mnemonic UMULL UXTB UXTH

syn keyword AArch64Mnemonic WFE WFI

syn keyword AArch64Mnemonic YIELD

syn keyword AArch64Mnemonic ABS ADD ADDHN ADDHN2 ADDP ADDV AESD AESE AESIMC
syn keyword AArch64Mnemonic AESMC AND

syn keyword AArch64Mnemonic BIC BIF BIT BSL

syn keyword AArch64Mnemonic CLS CLZ CMEQ CMGE CMGT CMHI CMHS CMLE CMLT CMTST
syn keyword AArch64Mnemonic CNT

syn keyword AArch64Mnemonic DUP

syn keyword AArch64Mnemonic EOR EXT

syn keyword AArch64Mnemonic FABD FABS FACGE FACGT FADD FADDP FCCMP FCCMPE
syn keyword AArch64Mnemonic FCMEQ FCMGE FCMGT FCMLE FCMLT FCMP FCMPE FCSEL
syn keyword AArch64Mnemonic FCVT FCVTAS FCVTAU FCVTL FCVTL2 FCVTNS FCVTNU
syn keyword AArch64Mnemonic FCVTPS FCVTPU FCVTXN FCVTXN2 FCVTZS FCVTZU FDIV
syn keyword AArch64Mnemonic FMADD FMAX FMAXNM FMAXMP FMAXNMV FMAXP FMAXV FMIN
syn keyword AArch64Mnemonic FMINNM FMINNMP FMINNMV FMINP FMINV FMLA FMLS FMOV
syn keyword AArch64Mnemonic FMSUB FMUL FMULX FNEG FNMADD FNMSUB FNMUL FRECPE
syn keyword AArch64Mnemonic FRECPS FRECPX FRINTA FRINTI FRINTM FRINTN FRINTP
syn keyword AArch64Mnemonic FRINTX FRINTX FRINTZ FRSQRTE FRSQRTS FSQRT FSUB

syn keyword AArch64Mnemonic INS

syn keyword AArch64Mnemonic LD1 LD1R LD2 LD2R LD3 LD3R LD4 LD4R LDNP LDP LDR
syn keyword AArch64Mnemonic LDUR

syn keyword AArch64Mnemonic MLA MLS MOV MOVI MUL MVN MVNI

syn keyword AArch64Mnemonic NEG NOT

syn keyword AArch64Mnemonic ORN ORR

syn keyword AArch64Mnemonic PMUL PMULL PMULL2

syn keyword AArch64Mnemonic RBIT REV16 REV32 REV64 RSHRN RSHRN2 RSUBHN
syn keyword AArch64Mnemonic RSUBHN2

syn keyword AArch64Mnemonic SABA SABAL SABAL2 SABD SABDL SABDL2 SADALP SADDL
syn keyword AArch64Mnemonic SADDL2 SADDLP SADDLV SADDW SADDW2 SCVTF SHA1C
syn keyword AArch64Mnemonic SHA1H SHA1M SHA1P SHA1SU0 SHA1SU1 SHA256H2
syn keyword AArch64Mnemonic SHA256H SHA256SU0 SHA256SU1 SHADD SHL SHLL SHLL2
syn keyword AArch64Mnemonic SHRN SHRN2 SHSUB SLI SMAX SMAXP SMAXV SMIN SMINP
syn keyword AArch64Mnemonic SMINV SMLAL SMLAL2 SMLSL SMLSL2 SMOV SMULL SMULL2
syn keyword AArch64Mnemonic SQABS SQADD SQDMLAL SQDMLAL2 SQDMLSL SQDMLSL2
syn keyword AArch64Mnemonic SQDMULH SQDMULL SQDMULL2 SQNEG SQRDMULH SQRSHL
syn keyword AArch64Mnemonic SQRSHRN SQRSHRN2 SQSHL SQSHLU SQSHRN SQSHRN2
syn keyword AArch64Mnemonic SQSUB SQXTN SQXTN2 SQXTUN SQXTUN2 SHRADD SRI
syn keyword AArch64Mnemonic SRSHL SRSHR SRSRA SSHL SSHLL SSHLL2 SSHHR SSRA
syn keyword AArch64Mnemonic SSUBL SSUBL2 SSUBW SSUBW2 ST1 ST2 ST3 ST4 STNP
syn keyword AArch64Mnemonic STP STR STUR SUB SUBHN SUBHN2 SUQADD SXTL

syn keyword AArch64Mnemonic TBL TBX TRN1 TRN2

syn keyword AArch64Mnemonic UABA UABAL UABAL2 UABD UABDL UABDL2 UADALP UADDL
syn keyword AArch64Mnemonic UADDL2 UADDLP UADDLV UADDW UADDW2 UCVTF UHADD
syn keyword AArch64Mnemonic UHSUB UMAX UMAXP UMAXV UMIN UMINP UMINV UMLAL
syn keyword AArch64Mnemonic UMLAL2 UMLSL UMLSL2 UMOV UMULL UMULL2 UQADD
syn keyword AArch64Mnemonic UQRSHL UQRSHRN UQRSHRN2 UQSHL UQSHRN UQSUB UQXTN
syn keyword AArch64Mnemonic UQXTN2 URECPE URHADD URSHL URSHR URSQRTE URSRA
syn keyword AArch64Mnemonic USHL USHLL USHLL2 USHR USQADD USRA USUBL USUBL2
syn keyword AArch64Mnemonic USUBW USUBW2 UXTL UZP1 UZP2

syn keyword AArch64Mnemonic XTN XTN2

syn keyword AArch64Mnemonic ZIP1 ZIP2

syn match AArch64Macro  /#[_a-zA-Z][_a-zA-Z0-9]*/

syn match AArch64Number /#-\?\d\+/
syn match AArch64Number /#([^)]\+)/
syn match AArch64Number /#\?-\?0x\x\+/
syn match AArch64Number /#\?-\?0b[01]\+/
" TODO(compnerd) add floating point numeric literals

" NOTE(compnerd) this must be matched after numerics
syn match AArch64Label /\d\{1,2\}[:fb]/

syn keyword AArch64Operator ! ==


syn match AArch64Register /[wxvqds][0-3]/ 
syn match AArch64Register /[wxvqds][0-3][0-9]/

 
syn keyword AArch64Register wzr xzr

syn keyword AArch64Register sp pc pstate

syn match AArch64Type /[@%]function/
syn match AArch64Type /[@%]object/
syn match AArch64Type /[@%]tls_object/
syn match AArch64Type /[@%]common/
syn match AArch64Type /[@%]notype/
syn match AArch64Type /[@%]gnu_unique_object/

highlight default link AArch64Comment    Comment
highlight default link AArch64Directive  PreProc
highlight default link AArch64Identifier Identifier
highlight default link AArch64Label      Label
highlight default link AArch64Macro      Macro
highlight default link AArch64Mnemonic   Keyword
highlight default link AArch64Modifier   Special
highlight default link AArch64Number     Number
highlight default link AArch64Operator   Operator
highlight default link AArch64Register   StorageClass
highlight default link AArch64Type       Tag
highlight default link AArch64TODO       Todo

let b:current_syn = "aarch64"

