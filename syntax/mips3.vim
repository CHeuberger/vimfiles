" mips.vim - Syntax highlighting for Stationeers MIPS
" Maintainer: Carlos F Heuberger
" Version:    0.2

if exists("b:current_syntax")
    finish
endif

let s:keepcpo= &cpo
set cpo&vim

"-----------------------------------------------------------------------------

syn case match

syn iskeyword @,48-57,.

" syn keyword mipsOp abs acos add alias and asin atan bap bapal bapz bapzal bdns bdnsal bdse bdseal beq beqal beqz beqzal bge bgeal bgez bgezal bgt bgtal bgtz bgtzal ble bleal blez blezal blt bltal bltz bltzal bna bnaal bnaz bnazal bne bneal bnez bnezal brap brapz brdns brdse breq breqz brge brgez brgt brgtz brle brlez brlt brltz brna brnaz brne brnez ceil cos define div exp floor hcf j jal jr jr l log lr ls max min mod move mul nor or peek pop push rand round s sap sapz sdns sdse select seq seqz sge sgez sgt sgtz sin sle sleep slez slt sltz sna snaz sne snez sqrt sub tan trunc xor yield 

" syn keyword mipsVar Activate AirRelease Charge ClearMemory Color CompletionRatio ElevatorLevel ElevatorSpeed Error ExportCount ExportQuantity Filtration ForceWrite Harvest Horizontal HorizontalRatio Idle ImportCount ImportQuantity Lock Maximum Mode On Open Output Plant PositionX PositionY PositionZ Power PowerActual PowerGeneration PowerPotential PowerRequired PrefabHash Pressure PressureExternal PressureInternal PressureSetting Quantity Ratio RatioCarbonDioxide RatioNitrogen RatioNitrousOxide RatioOxygen RatioPollutant RatioVolatiles RatioWater Reagents RecipeHash RequestHash RequiredPower Setting SettingInputHash SettingOutputHash SignalID SignalStrength SolarAngle TargetX TargetY TargetZ Temperature TemperatureExternal TemperatureSetting TotalMoles VelocityMagnitude VelocityRelativeX VelocityRelativeY VelocityRelativeZ Vertical VerticalRatio Volume

" syn keyword mipsVarDeprecated ExportSlotHash ExportSlotOccupant ImportSlotHash ImportSlotOccupant PlantEfficiency1 PlantEfficiency2 PlantEfficiency3 PlantEfficiency4 PlantGrowth1 PlantGrowth2 PlantGrowth3 PlantGrowth4 PlantHash1 PlantHash2 PlantHash3 PlantHash4 PlantHealth1 PlantHealth2 PlantHealth3 PlantHealth4 

" syn keyword mipsSlot Charge ChargeRatio Class Damage Efficiency Growth Health Mature MaxQuantity OccupantHash Occupied PrefabHash Pressure PressureAir PressureWaste Quantity Temperature


" syn match mipsName "\v<[0-9a-zA-Z.]+>"

" syn match mipsOpDeprecated "\v<label>"

" syn match mipsNum "\v[+-]=<[0-9]+>"
" syn match mipsNum "\v[+-]=\.<[0-9]+>"
" syn match mipsNum "\v[+-]=<[0-9]+\.[0-9]+>"

" syn match mipsReg "\v<ra>"
" syn match mipsReg "\v<r+[0-9]>"
" syn match mipsReg "\v<r+1[0-7]>"

" syn match mipsDevice "\v<d[0-5b]>"
" syn match mipsDevice "\v<dra>"
" syn match mipsDevice "\v<dr+1[0-7]>"
" syn match mipsDevice "\v<dr+[0-9]>"

" syn match mipsLabel "\v^\s*<[0-9a-zA-Z.]+:\s*$"
" syn match mipsLabel "\v^\s*<[0-9a-zA-Z.]+:\s*\#"me=e-1

" syn match mipsComment "\v\#.*$"

syn match mipsError "\v\s*\zs[^ \t#][^#]*"

syn match mipsAlias "\v<alias>\ze\s+<\k+>\s+<\k+>" skipwhite nextgroup=mipsAliasName
syn match mipsAliasName contained "\v<\k+>" skipwhite nextgroup=mipsAliasDevice,mipsAliasRegister
syn match mipsAliasDevice contained "\v<d[0-5b]>"
syn match mipsAliasRegister contained "\v<r[0-9a]>"
syn match mipsAliasRegister contained "\v<r1[0-7]>"

syn match mipsDefine "\v<define>\ze\s+<\k+>\s+<\S+>" skipwhite nextgroup=mipsDefineName
syn match mipsDefineName contained "\v<\k+>" skipwhite nextgroup=mipsDefineNumber
syn match mipsDefineNumber contained "\v[+-]=<\d+%(\.\d*)=>"
syn match mipsDefineNumber contained "\v[+-]=<\d*\.\d+>"

syn match mipsOp3 "\v\ze<\k+>\s+<\k+>\s+<\k+>\s+<\k+>" nextgroup=mipsOp3Op
syn keyword mipsOp3Op contained abs add skipwhite nextgroup=mipsOp3Arg1R,mipsOp3Arg1K
syn match mipsOp3Arg1K contained "\v<\k+>" skipwhite nextgroup=mipsOp3Arg2N,mipsOp3Arg2R,mipsOp3Arg2K
syn match mipsOp3Arg1R contained "\v<%(r[0-9a]|r1[0-7])>" skipwhite nextgroup=mipsOp3Arg2N,mipsOp3Arg2R,mipsOp3Arg2K
syn match mipsOp3Arg2K contained "\v<\k+>" skipwhite nextgroup=mipsOp3Arg3N,mipsOp3Arg3R,mipsOp3Arg3K
syn match mipsOp3Arg2R contained "\v<%(r[0-9a]|r1[0-7])>" skipwhite nextgroup=mipsOp3Arg3N,mipsOp3Arg3R,mipsOp3Arg3K
syn match mipsOp3Arg2N contained "\v[+-]=<%(\d+%(\.\d*)=|\d*\.\d+)>" skipwhite nextgroup=mipsOp3Arg3N,mipsOp3Arg3R,mipsOp3Arg3K
syn match mipsOp3Arg3K contained "\v<\k+>"
syn match mipsOp3Arg3R contained "\v<%(r[0-9a]|r1[0-7])>"
syn match mipsOp3Arg3N contained "\v[+-]=<%(\d+%(\.\d*)=|\d*\.\d+)>"

syn match mipsLabel "\v\s*\zs\k+\:\ze\s*$"
syn match mipsLabel "\v\s*\zs\k+\:\ze\s*\#"

syn match mipsComment "\v\s*\zs\#.*$"

".............................................................................

hi def link mipsError Error
hi def link mipsAlias Define
hi def link mipsAliasName Identifier
hi def link mipsAliasDevice Constant
hi def link mipsAliasRegister Constant
hi def link mipsDefine Define
hi def link mipsDefineName Identifier
hi def link mipsDefineNumber Number
hi def link mipsOp3 Statement
hi def link mipsOp3Op mipsOp3
hi def link mipsOp3Arg1R Constant
hi def link mipsOp3Arg1K Identifier
hi def link mipsOp3Arg2N Number
hi def link mipsOp3Arg2R Constant
hi def link mipsOp3Arg2K Identifier
hi def link mipsOp3Arg3N Number
hi def link mipsOp3Arg3R Constant
hi def link mipsOp3Arg3K Identifier
hi def link mipsLabel Label
hi def link mipsComment Comment

".............................................................................

nmap gx :syn on<CR>
vmap gx :syn on<CR>

"-----------------------------------------------------------------------------

let b:current_syntax = "mips"

let &cpo = s:keepcpo
unlet s:keepcpo

" vim:ts=18  sw=2  fdm=marker
