" Vim syntax file
" Hacked by Adam, from the 68000 asm syntax....
"  x Language:	Motorola 68000 Assembler
"  x Maintainer:	Steve Wall
" Last change:	2001 May 01
"
" This is incomplete.  In particular, support for 68020 and
" up and 68851/68881 co-processors is partial or non-existant.
" Feel free to contribute...
"

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore
 syn region asmx86Comment	start="#\(\(\(include\)\|\(define\)\|\(if\)\|\(ifndef\)\|\(endif\)\|\(end\)\|\(ifdef\)\)\s\)\!" end="$"


 syn region asmx86Commenthash	start="#\(\(define\)\|\(if\(n\=\(def\)\)\=\)\|\(include\)\|\(error\)\|\(end\(if\)\=\)\)\!" end="$" contains=asmx86Todo

syn region asmx86Commenthash	start="#" end="$" contains=asmx86Todo


syn match asmx86Operator	"[-+*/]"	" Must occur before Comments

syn match asmx86PreProc		"^\s*#\s*\(\(if\(n\=\(def\)\)\=\)\|\(end\(if\)\=\)\|\(define\)\|\(error\)\|\(else\)\)\>"


syn region asmx86Commentcpp	start="\s*#\s*if\s\+0\+\>" end="\s*#\s*endif\>" contains=asmx86Todo
syn region asmx86Commentcxx	start="//" end="$" contains=asmx86Todo
syn region asmx86Commentc	start="/\*" end="\*/" contains=asmx86Todo


" Preprocessor, basics:


" First make ALL things that are behind #'s and the endline as comments.  Then
" boil out the stuff that is vaild, like #defines, and such....  It's
" kinda tough, since we're allowing two conflicting syntaxes.  But when we
" consider that the "#" mechanism in the pre-processor isn't ever seen by the
" underlying language, it begins to show itself, on why it is so weird.
" There's going to be "#"'es left behind by the cpp, so we need to remember
" that the assembler will see those as commments.  We provide this commenting



syn match asmx86Comment "/;;.*/"

" Segment Registers --
syn match asmx86Reg	"%[cdefgs]s"


" Partial list of register symbols
" General Purpose Registers --
"syn keyword asmx86Reg	eax ax al ah
syn match asmx86Reg	"%[abcd][xhl]"
syn match asmx86Reg	"%[re][abcd]x"
syn match asmx86Reg	"%r[0-5][bdw]"
syn match asmx86Reg	"%r[8-9][bdw]"

" syn keyword asmx86Reg	ebx bx bl bh
" syn keyword asmx86Reg	ecx cx cl ch
" syn keyword asmx86Reg	edx dx dl dh

" "Special" Registers --
"syn keyword asmx86Reg	ebp bp edi di esi si esp sp
syn match asmx86Reg	"%[re][bdis][pi]"
syn match asmx86Reg	"%[bs]p"
syn match asmx86Reg	"%[ds]i"




" Protection, extra, and magic registers for all the OS-type fun stuff --
syn match asmx86Reg	"%[cd]r[0-3]"
syn match asmx86Reg	"%[td]r[3-7]"
" syn keyword asmx86Reg	cr0 cr1 cr2 cr3 
" syn keyword asmx86Reg	tr3 tr4 tr5 tr6 tr7
" syn keyword asmx86Reg	dr0 dr1 dr2 dr3 dr4 dr5 dr6 dr7

syn keyword asmx86Reg	gdtr ldtr idtr tr msw pdbr pfla

" Page descriptor base register and page fault linear address

" MC68010
"syn keyword asmx86Reg	vbr sfc sfcr dfc dfcr

" MC68020
"syn keyword asmx86Reg	msp isp zpc cacr caar
"syn keyword asmx86Reg	za0 za1 za2 za3 za4 za5 za6 za7
"syn keyword asmx86Reg	zd0 zd1 zd2 zd3 zd4 zd5 zd6 zd7

" MC68030
"syn keyword asmx86Reg	crp srp tc ac0 ac1 acusr tt0 tt1 mmusr

" MC68040
"syn keyword asmx86Reg	dtt0 dtt1 itt0 itt1 urp

" MC68851 registers
"syn keyword asmx86Reg	cal val scc crp srp drp tc ac psr pcsr
"syn keyword asmx86Reg	bac0 bac1 bac2 bac3 bac4 bac5 bac6 bac7
"syn keyword asmx86Reg	bad0 bad1 bad2 bad3 bad4 bad5 bad6 bad7

" MC68881/82 registers
"syn keyword asmx86Reg	fp0 fp1 fp2 fp3 fp4 fp5 fp6 fp7
"syn keyword asmx86Reg	control status iaddr fpcr fpsr fpiar


"Not sure if this is the case for x86......
" M68000 opcodes - order is important!
syn match asmx86Opcode		"\<aa[asdm][bwlq]\=\s"
syn match asmx86Opcode		"\<ad[cd][bwlq]\=\s"
syn match asmx86Opcode		"\<and[bwlq]\=\s"
syn match asmx86Opcode		"\<arpl\s"

syn match asmx86Opcode_br	"\<bound[lw]\=\s"
syn match asmx86Opcode		"\<bs[rf][lw]\=\s"
syn match asmx86Opcode		"\<bswap[lw]\=\s"
syn match asmx86Opcode		"\<bt[rcs]\=[lw]\=\s"

syn match asmx86Opcode_br	"\<call[fq]\=\s"
syn match asmx86Opcode		"\<cbw\s"
syn match asmx86Opcode		"\<cwde\s"
syn match asmx86Opcode		"\<cl\([cdi]\|\(ts\)\)\>"
syn match asmx86Opcode		"\<cmc\s"
syn match asmx86Opcode		"\<cmp\(xchg\)\=[bwlq]\=\s"
syn match asmx86Opcode		"\<cmps[bwdl]\=\>"
syn match asmx86Opcode		"\<c\(\(wd\)\|\(dq\)\)\s"

syn match asmx86Opcode		"\<da[sd]\=\s"
syn match asmx86Opcode		"\<dec[bwlq]\=\s"
syn match asmx86Opcode		"\<div[bwlq]\=\s"

syn match asmx86Opcode		"\<enter[bwlq]\=\s"

" Skipping all FPU instructions.....

syn match asmx86Opcode_br	"\<hlt\>"

syn match asmx86Opcode		"\<idiv[bwlq]\=\s"
syn match asmx86Opcode		"\<imul[bwlq]\=\s"
syn match asmx86Opcode_io	"\<in[bwlq]\=\s"
syn match asmx86Opcode_io	"\<ins[bwdl]\=\>"
syn match asmx86Opcode		"\<inc[bwlq]\=\s"
syn match asmx86Opcode_br	"\<int\s"
syn match asmx86Opcode_br	"\<int[o3]\>"
syn match asmx86Opcode		"\<inv\(\(d\)\|\(lpg\)\)\s"
syn match asmx86Opcode_br	"\<iretd\=\>"

"" Main x86 branch instructions...

syn match asmx86Opcode_br	"\<j.\{,4}\s"
" This is, above, the hack.  It will not show valid/invalid jcc opcodes, now...
" This will be fixed later, this is just to have working j???? working now....
syn match asmx86Opcode_br	"\<l\=jmp[fblwd]\=\s"

syn match asmx86Opcode		"\<lahf\s"
syn match asmx86Opcode		"\<lar\s"
syn match asmx86Opcode_mv	"\<lea[lw]\=\s"
syn match asmx86Opcode		"\<leave\>"
syn match asmx86Opcode_mv	"\<l[gil]dtl\=\s"
syn match asmx86Opcode_mv	"\<l[defgs]s\s"
syn match asmx86Opcode_mv	"\<lmsw\s"
syn match asmx86Opcode		"\<lock\>"
syn match asmx86Opcode_mv	"\<lods[lwdb]\=\>"
syn match asmx86Opcode_br	"\<loopn\=[ez]\=\s"
syn match asmx86Opcode_mv	"\<lsl\s"
syn match asmx86Opcode_mv	"\<ltr\s"

syn match asmx86Opcode_mv	"\<mov[bwlq]\=\s"
syn match asmx86Opcode_mv	"\<movs[lwdb]\=\>"
syn match asmx86Opcode_mv	"\<movsx[bwlq]\=\s"
syn match asmx86Opcode_mv	"\<movzx[bwlq]\=\s"
syn match asmx86Opcode		"\<mul[bwlq]\=\s"

syn match asmx86Opcode		"\<neg[bwlq]\=\s"
syn match asmx86Opcode		"\<nop\>"
syn match asmx86Opcode		"\<not[bwlq]\=\s"

syn match asmx86Opcode		"\<or[bwlq]\=\s"
syn match asmx86Opcode_io	"\<out[bwlq]\=\s"
syn match asmx86Opcode_io	"\<outs[dbwlq]\=\>"

syn match asmx86Opcode_mv	"\<pop[bwlq]\=\s"
syn match asmx86Opcode_mv	"\<pop[af][wld]\=\>"
syn match asmx86Opcode_mv	"\<push[bwlq]\=\s"
syn match asmx86Opcode_mv	"\<push[af][wld]\=\>"

syn match asmx86Opcode		"\<r[co][rl][bwlq]\=\s"
syn match asmx86Opcode_pre	"\<repn\=[ez]\=\s"
syn match asmx86Opcode_br	"\<ret[fq]\=\>"
syn match asmx86Opcode		"\<sahf\>"
syn match asmx86Opcode		"\<s[ah][rl][bwlq]\=\s"
syn match asmx86Opcode		"\<sbb[bwlq]\=\s"
syn match asmx86Opcode		"\<scas[bwlqd]\=\s"
syn match asmx86Opcode		"\<set.\{,3}\s"
" We do the same hack as a jmp here.  We'll only allow the valid ones, later.
syn match asmx86Opcode_mv	"\<s[gil]dtl\=\s"
syn match asmx86Opcode		"\<sh[lr][dbwlq]\=\s"
syn match asmx86Opcode_mv	"\<smsw\s"
syn match asmx86Opcode		"\<st[cdi]\>"
syn match asmx86Opcode_mv	"\<stos[bwlqd]\=\>"
syn match asmx86Opcode_mv	"\<str\s"
syn match asmx86Opcode		"\<sub[bwlq]\=\s"

syn match asmx86Opcode		"\<test[bwlq]\=\s"

syn match asmx86Opcode		"\<ver[rw]\s"

syn match asmx86Opcode		"\<wait\>"
syn match asmx86Opcode		"\<wbinvd\>"

syn match asmx86Opcode_mv	"\<xadd[bwlq]\=\s"
syn match asmx86Opcode_mv	"\<xchg[bwlq]\=\s"
syn match asmx86Opcode_mv	"\<xlatb\=\>"
syn match asmx86Opcode		"\<xor[bwlq]\=\s"


" 68k instructions... here, because they are sometimes matching, and we haven't
" gotten the x86 ones up to speed yet....


" syn match asmx86Opcode "\<abcd\(\.b\)\=\s"
" syn match asmx86Opcode "\<adda\(\.[wl]\)\=\s"
" syn match asmx86Opcode "\<addi\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<addq\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<addx\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<add\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<andi\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<and\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<as[lr]\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<b[vc][cs]\(\.[bwlqs]\)\=\s"
" syn match asmx86Opcode "\<beq\(\.[bwlqs]\)\=\s"
" syn match asmx86Opcode "\<bg[et]\(\.[bwlqs]\)\=\s"
" syn match asmx86Opcode "\<b[hm]i\(\.[bwlqs]\)\=\s"
" syn match asmx86Opcode "\<bl[est]\(\.[bwlqs]\)\=\s"
" syn match asmx86Opcode "\<bne\(\.[bwlqs]\)\=\s"
" syn match asmx86Opcode "\<bpl\(\.[bwlqs]\)\=\s"
" syn match asmx86Opcode "\<bchg\(\.[bl]\)\=\s"
" syn match asmx86Opcode "\<bclr\(\.[bl]\)\=\s"
" syn match asmx86Opcode "\<bfchg\s"
" syn match asmx86Opcode "\<bfclr\s"
" syn match asmx86Opcode "\<bfexts\s"
" syn match asmx86Opcode "\<bfextu\s"
" syn match asmx86Opcode "\<bfffo\s"
" syn match asmx86Opcode "\<bfins\s"
" syn match asmx86Opcode "\<bfset\s"
" syn match asmx86Opcode "\<bftst\s"
" syn match asmx86Opcode "\<bkpt\s"
" syn match asmx86Opcode "\<bra\(\.[bwlqs]\)\=\s"
" syn match asmx86Opcode "\<bset\(\.[bl]\)\=\s"
" syn match asmx86Opcode "\<bsr\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<btst\(\.[bl]\)\=\s"
" syn match asmx86Opcode "\<callm\s"
" syn match asmx86Opcode "\<cas2\(\.[wl]\)\=\s"
" syn match asmx86Opcode "\<cas\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<chk2\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<chk\(\.[wl]\)\=\s"
" syn match asmx86Opcode "\<clr\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<cmpa\(\.[wl]\)\=\s"
" syn match asmx86Opcode "\<cmpi\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<cmpm\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<cmp2\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<cmp\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<db[cv][cs]\(\.w\)\=\s"
" syn match asmx86Opcode "\<dbeq\(\.w\)\=\s"
" syn match asmx86Opcode "\<db[ft]\(\.w\)\=\s"
" syn match asmx86Opcode "\<dbg[et]\(\.w\)\=\s"
" syn match asmx86Opcode "\<db[hm]i\(\.w\)\=\s"
" syn match asmx86Opcode "\<dbl[est]\(\.w\)\=\s"
" syn match asmx86Opcode "\<dbne\(\.w\)\=\s"
" syn match asmx86Opcode "\<dbpl\(\.w\)\=\s"
" syn match asmx86Opcode "\<dbra\(\.w\)\=\s"
" syn match asmx86Opcode "\<div[su]\(\.[wl]\)\=\s"
" syn match asmx86Opcode "\<div[su]l\(\.l\)\=\s"
" syn match asmx86Opcode "\<eori\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<eor\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<exg\(\.l\)\=\s"
" syn match asmx86Opcode "\<extb\(\.l\)\=\s"
" syn match asmx86Opcode "\<ext\(\.[wl]\)\=\s"
" syn match asmx86Opcode "\<illegal\>"
" syn match asmx86Opcode "\<jmp\(\.[ls]\)\=\s"
" syn match asmx86Opcode "\<jsr\(\.[ls]\)\=\s"
" syn match asmx86Opcode "\<lea\(\.l\)\=\s"
" syn match asmx86Opcode "\<link\(\.[wl]\)\=\s"
" syn match asmx86Opcode "\<ls[lr]\(\.[bwlq]\)\=\s"

" syn match asmx86Opcode "\<movea\(\.[wl]\)\=\s"
" syn match asmx86Opcode "\<movec\(\.l\)\=\s"
" syn match asmx86Opcode "\<movem\(\.[wl]\)\=\s"
" syn match asmx86Opcode "\<movep\(\.[wl]\)\=\s"
" syn match asmx86Opcode "\<moveq\(\.l\)\=\s"
" syn match asmx86Opcode "\<moves\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<move\(\.[bwlq]\)\=\s"


" syn match asmx86Opcode "\<mul[su]\(\.[wl]\)\=\s"
" syn match asmx86Opcode "\<nbcd\(\.b\)\=\s"
" syn match asmx86Opcode "\<negx\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<neg\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<nop\>"
" syn match asmx86Opcode "\<not\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<ori\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<or\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<pack\s"
" syn match asmx86Opcode "\<pea\(\.l\)\=\s"
" syn match asmx86Opcode "\<reset\>"
" syn match asmx86Opcode "\<ro[lr]\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<rox[lr]\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<rt[dm]\s"
" syn match asmx86Opcode "\<rt[ers]\>"
" syn match asmx86Opcode "\<sbcd\(\.b\)\=\s"
" syn match asmx86Opcode "\<s[cv][cs]\(\.b\)\=\s"
" syn match asmx86Opcode "\<seq\(\.b\)\=\s"
" syn match asmx86Opcode "\<s[ft]\(\.b\)\=\s"
" syn match asmx86Opcode "\<sg[et]\(\.b\)\=\s"
" syn match asmx86Opcode "\<s[hm]i\(\.b\)\=\s"
" syn match asmx86Opcode "\<sl[est]\(\.b\)\=\s"
" syn match asmx86Opcode "\<sne\(\.b\)\=\s"
" syn match asmx86Opcode "\<spl\(\.b\)\=\s"
" syn match asmx86Opcode "\<suba\(\.[wl]\)\=\s"
" syn match asmx86Opcode "\<subi\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<subq\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<subx\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<sub\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<swap\(\.w\)\=\s"
" syn match asmx86Opcode "\<tas\(\.b\)\=\s"
" syn match asmx86Opcode "\<tdiv[su]\(\.l\)\=\s"
" syn match asmx86Opcode "\<t\(rap\)\=[cv][cs]\(\.[wl]\)\=\s"
" syn match asmx86Opcode "\<t\(rap\)\=eq\(\.[wl]\)\=\s"
" syn match asmx86Opcode "\<t\(rap\)\=[ft]\(\.[wl]\)\=\s"
" syn match asmx86Opcode "\<t\(rap\)\=g[et]\(\.[wl]\)\=\s"
" syn match asmx86Opcode "\<t\(rap\)\=[hm]i\(\.[wl]\)\=\s"
" syn match asmx86Opcode "\<t\(rap\)\=l[est]\(\.[wl]\)\=\s"
" syn match asmx86Opcode "\<t\(rap\)\=ne\(\.[wl]\)\=\s"
" syn match asmx86Opcode "\<t\(rap\)\=pl\(\.[wl]\)\=\s"
" syn match asmx86Opcode "\<t\(rap\)\=v\>"
" syn match asmx86Opcode "\<t\(rap\)\=[cv][cs]\>"
" syn match asmx86Opcode "\<t\(rap\)\=eq\>"
" syn match asmx86Opcode "\<t\(rap\)\=[ft]\>"
" syn match asmx86Opcode "\<t\(rap\)\=g[et]\>"
" syn match asmx86Opcode "\<t\(rap\)\=[hm]i\>"
" syn match asmx86Opcode "\<t\(rap\)\=l[est]\>"
" syn match asmx86Opcode "\<t\(rap\)\=ne\>"
" syn match asmx86Opcode "\<t\(rap\)\=pl\>"
" syn match asmx86Opcode "\<trap\s"
" syn match asmx86Opcode "\<tst\(\.[bwlq]\)\=\s"
" syn match asmx86Opcode "\<unlk\s"
" syn match asmx86Opcode "\<unpk\s"

" Valid labels
syn match asmx86Label		"^[a-z_?.][a-z0-9_?.$]*$"
syn match asmx86Label		"^[a-z_?.][a-z0-9_?.$]*\s"he=e-1
syn match asmx86Label		"^\s*[a-z_?.][a-z0-9_?.$]*:"he=e-1

" Various number formats
syn match hexNumber		"\$[0-9a-fA-F]\+\>"
syn match hexNumber		"$0x[0-9a-fA-F]\+\>"
syn match hexNumber		"[-]0x[0-9a-fA-F]\+\>"
syn match hexNumber		/\<0x[0-9a-fA-F]\+\>/
syn match hexNumber		/\<[0-9a-fA-F]\+\>/
syn match octNumber		"@[0-7]\+\>"
syn match octNumber		"\<[0-7]\+[QO]\>"
syn match binNumber		"%[01]\+\>"
syn match binNumber		"\<[01]\+B\>"
syn match decNumber		"\<[0-9]\+D\=\>"
syn match floatE		"_*E_*" contained
syn match floatExponent		"_*E_*[-+]\=[0-9]\+" contained contains=floatE
syn match floatNumber		"[-+]\=[0-9]\+_*E_*[-+]\=[0-9]\+" contains=floatExponent
syn match floatNumber		"[-+]\=[0-9]\+\.[0-9]\+\(E[-+]\=[0-9]\+\)\=" contains=floatExponent
syn match floatNumber		":\([0-9a-f]\+_*\)\+"

" Character string constants
"syn match asmx86StringError	"'[ -~]*'"
"syn match asmx86StringError	"'[ -~]*$"
"syn region asmx86String		start="'" skip="''" end="'" oneline contains=asmx86CharError
syn match asmx86CharError	"[^ -~]" contained

" Immediate data
" syn match asmx86Immediate	"#\$[0-9a-fA-F]\+" contains=hexNumber
" syn match asmx86Immediate	"#[0-9][0-9a-fA-F]*H" contains=hexNumber
" syn match asmx86Immediate	"#@[0-7]\+" contains=octNumber
" syn match asmx86Immediate	"#[0-7]\+[QO]" contains=octNumber
" syn match asmx86Immediate	"#%[01]\+" contains=binNumber
" syn match asmx86Immediate	"#[01]\+B" contains=binNumber
" syn match asmx86Immediate	"#[0-9]\+D\=" contains=decNumber
syn match asmx86Symbol		"[a-z_?.][a-z0-9_?.$]*" contained
" syn match asmx86Immediate	"#[a-z_?.][a-z0-9_?.]*" contains=asmx86Symbol

" Special items for comments
syn keyword asmx86Todo		contained TODO XXX FIXME CHANGED

" Operators
syn match asmx86Operator	"\.SIZEOF\."
syn match asmx86Operator	"\.STARTOF\."
syn match asmx86Operator	"<<"		" shift left
syn match asmx86Operator	">>"		" shift right
syn match asmx86Operator	"&"		" bit-wise logical and
syn match asmx86Operator	"!"		" bit-wise logical or
syn match asmx86Operator	"!!"		" exclusive or
syn match asmx86Operator	"<>"		" inequality
syn match asmx86Operator	"="		" must be before other ops containing '='
syn match asmx86Operator	">="
syn match asmx86Operator	"<="
syn match asmx86Operator	"=="		" operand existance - used in macro definitions

" Condition code style operators
syn match asmx86Operator	"<[CV][CS]>"
syn match asmx86Operator	"<EQ>"
syn match asmx86Operator	"<G[TE]>"
syn match asmx86Operator	"<[HM]I>"
syn match asmx86Operator	"<L[SET]>"
syn match asmx86Operator	"<NE>"
syn match asmx86Operator	"<PL>"

" Include
syn match asmx86Include		"\<INCLUDE\s"
syn region asmIncluded	display contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match asmx86Included	display contained "<[^"]*>"
syn match asmx86Include	display "^\s*#\s*include\>\s*["<]" contains=asmx86Included

" Comments
 syn match asmx86Comment		"#.*" contains=asmx86Todo
 syn match asmx86Comment		"\s!.*"ms=s+1 contains=asmx86Todo
 syn match asmx86Comment		"^\s*[*!].*" contains=asmx86Todo

" Standard macros
syn match asmx86Cond		"\<IF\(\.[BWL]\)\=\s"
syn match asmx86Cond		"\<THEN\(\.[SL]\)\=\>"
syn match asmx86Cond		"\<ELSE\(\.[SL]\)\=\>"
syn match asmx86Cond		"\<ENDI\>"
syn match asmx86Cond		"\<BREAK\(\.[SL]\)\=\>"
syn match asmx86Repeat		"\<FOR\(\.[BWL]\)\=\s"
syn match asmx86Repeat		"\<DOWNTO\s"
syn match asmx86Repeat		"\<TO\s"
syn match asmx86Repeat		"\<BY\s"
syn match asmx86Repeat		"\<DO\(\.[SL]\)\=\>"
syn match asmx86Repeat		"\<ENDF\>"
syn match asmx86Repeat		"\<NEXT\(\.[SL]\)\=\>"
syn match asmx86Repeat		"\<REPEAT\>"
syn match asmx86Repeat		"\<UNTIL\(\.[BWL]\)\=\s"
syn match asmx86Repeat		"\<WHILE\(\.[BWL]\)\=\s"
syn match asmx86Repeat		"\<ENDW\>"

" Macro definition
syn match asmx86Macro		"\<MACRO\>"
syn match asmx86Macro		"\<LOCAL\s"
syn match asmx86Macro		"\<MEXIT\>"
syn match asmx86Macro		"\<ENDM\>"
syn match asmx86MacroParam	"\\[0-9]"

" Conditional assembly
syn match asmx86PreCond		"\<IFC\s"
syn match asmx86PreCond		"\<IFDEF\s"
syn match asmx86PreCond		"\<IFEQ\s"
syn match asmx86PreCond		"\<IFGE\s"
syn match asmx86PreCond		"\<IFGT\s"
syn match asmx86PreCond		"\<IFLE\s"
syn match asmx86PreCond		"\<IFLT\s"
syn match asmx86PreCond		"\<IFNC\>"
syn match asmx86PreCond		"\<IFNDEF\s"
syn match asmx86PreCond		"\<IFNE\s"
syn match asmx86PreCond		"\<ELSEC\>"
syn match asmx86PreCond		"\<ENDC\>"

" Loop control
syn match asmx86PreCond		"\<REPT\s"
syn match asmx86PreCond		"\<IRP\s"
syn match asmx86PreCond		"\<IRPC\s"
syn match asmx86PreCond		"\<ENDR\>"

" Directives
syn match asmx86Directive	"\.[A-Za-z_]\w*"
syn match asmx86Directive	"\<ALIGN\s"
syn match asmx86Directive	"\<CHIP\s"
syn match asmx86Directive	"\<COMLINE\s"
syn match asmx86Directive	"\<COMMON\(\.S\)\=\s"
syn match asmx86Directive	"\<DC\(\.[BWLSDXP]\)\=\s"
syn match asmx86Directive	"\<DC\.\\[0-9]\s"me=e-3	" Special use in a macro def
syn match asmx86Directive	"\<DCB\(\.[BWLSDXP]\)\=\s"
syn match asmx86Directive	"\<DS\(\.[BWLSDXP]\)\=\s"
syn match asmx86Directive	"\<END\>"
syn match asmx86Directive	"\<EQU\s"
syn match asmx86Directive	"\<FEQU\(\.[SDXP]\)\=\s"
syn match asmx86Directive	"\<FAIL\>"
syn match asmx86Directive	"\<FOPT\s"
syn match asmx86Directive	"\<\(NO\)\=FORMAT\>"
syn match asmx86Directive	"\<IDNT\>"
syn match asmx86Directive	"\<\(NO\)\=LIST\>"
syn match asmx86Directive	"\<LLEN\s"
syn match asmx86Directive	"\<MASK2\>"
syn match asmx86Directive	"\<NAME\s"
syn match asmx86Directive	"\<NOOBJ\>"
syn match asmx86Directive	"\<OFFSET\s"
syn match asmx86Directive	"\<OPT\>"
syn match asmx86Directive	"\<ORG\(\.[SL]\)\=\>"
syn match asmx86Directive	"\<\(NO\)\=PAGE\>"
syn match asmx86Directive	"\<PLEN\s"
syn match asmx86Directive	"\<REG\s"
syn match asmx86Directive	"\<RESTORE\>"
syn match asmx86Directive	"\<SAVE\>"
syn match asmx86Directive	"\<SECT\(\.S\)\=\s"
syn match asmx86Directive	"\<SECTION\(\.S\)\=\s"
syn match asmx86Directive	"\<SET\s"
syn match asmx86Directive	"\<SPC\s"
syn match asmx86Directive	"\<TTL\s"
syn match asmx86Directive	"\<XCOM\s"
syn match asmx86Directive	"\<XDEF\s"
syn match asmx86Directive	"\<XREF\(\.S\)\=\s"

syn match asmx86Constraint	"\.[a-z]\+[a-z0-9]*\>"
syn match asmx86Constraintconst	"\.\(\(byte\)\|\(d\=word\)\)\>"

syn region asmx86RelAddrr start=/</ end=/>/ containedin=ALL 

syn case match

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_asmx86_syntax_inits")
  if version < 508
    let did_asmx86_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default methods for highlighting.  Can be overridden later
  " Comment Constant Error Identifier PreProc Special Statement Todo Type
  "
  " Constant		Boolean Character Number String
  " Identifier		Function
  " PreProc		Define Include Macro PreCondit
  " Special		Debug Delimiter SpecialChar SpecialComment Tag
  " Statement		Conditional Exception Keyword Label Operator Repeat
  " Type		StorageClass Structure Typedef

  HiLink asmx86Comment		Comment
  HiLink asmx86Comment		DarkGrey
  HiLink asmx86Commentcpp	DarkGrey
  HiLink asmx86Commentc		DarkGrey
  HiLink asmx86Commentcxx	DarkGrey
  HiLink asmx86Commenthash	DarkGrey
  HiLink asmx86Todo		Todo

  HiLink hexNumber		Number		" Constant
  HiLink octNumber		Number		" Constant
  HiLink binNumber		Number		" Constant
  HiLink decNumber		Number		" Constant
  HiLink floatNumber		Number		" Constant
  HiLink floatExponent		Number		" Constant
  HiLink floatE			SpecialChar	" Statement
  "HiLink floatE		Number		" Constant

  HiLink asmx86Immediate	Identifier	" Statement
  "HiLink asmx86Symbol		Constant

  HiLink asmx86String		String		" Constant
  HiLink asmx86Included		String		" Constant
  HiLink asmx86CharError	Error
  HiLink asmx86StringError	Error

  HiLink asmx86Reg		Identifier
  HiLink asmx86Operator		Identifier

  HiLink asmx86Include		Include		" PreProc
  HiLink asmx86Macro		Macro		" PreProc
  HiLink asmx86PreProc		PreProc		" PreProc
  HiLink asmx86MacroParam	Keyword		" Statement

  HiLink asmx86Directive	Special
  HiLink asmx86PreCond		Special

  HiLink asmx86RelAddrr		Keyword
  HiLink asmx86Constraint	Keyword
  HiLink asmx86Constraintconst	Type


  HiLink asmx86Opcode		Keyword
  HiLink asmx86Opcode_mv	Special
  HiLink asmx86Opcode_pre	Todo
  HiLink asmx86Opcode_br	Macro
  HiLink asmx86Opcode_io	String
  HiLink asmx86Opcode_o2	String

" We have "normal" opcodes, "move" opcodes, "prefix" opcodes, and "branch"
" opcodes.....  Prefixes are rare, and we should alert them VERY specially

  HiLink asmx86Cond		Conditional	" Statement
  HiLink asmx86Repeat		Repeat		" Statement

  HiLink asmx86Label		Type
  delcommand HiLink
endif

let b:current_syntax = "asmx86"

" vim: ts=8 sw=2
