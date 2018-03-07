/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_216(char*, char *);
extern void execute_174(char*, char *);
extern void execute_177(char*, char *);
extern void execute_178(char*, char *);
extern void execute_179(char*, char *);
extern void execute_180(char*, char *);
extern void execute_16(char*, char *);
extern void execute_18(char*, char *);
extern void execute_20(char*, char *);
extern void execute_21(char*, char *);
extern void execute_23(char*, char *);
extern void execute_176(char*, char *);
extern void execute_183(char*, char *);
extern void execute_215(char*, char *);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_3(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[16] = {(funcp)execute_216, (funcp)execute_174, (funcp)execute_177, (funcp)execute_178, (funcp)execute_179, (funcp)execute_180, (funcp)execute_16, (funcp)execute_18, (funcp)execute_20, (funcp)execute_21, (funcp)execute_23, (funcp)execute_176, (funcp)execute_183, (funcp)execute_215, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_3};
const int NumRelocateId= 16;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/Functional_unit_tb_behav/xsim.reloc",  (void **)funcTab, 16);
	iki_vhdl_file_variable_register(dp + 23080);
	iki_vhdl_file_variable_register(dp + 23136);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/Functional_unit_tb_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/Functional_unit_tb_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/Functional_unit_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/Functional_unit_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/Functional_unit_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
