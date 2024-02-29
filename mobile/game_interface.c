#include "quakedef.h"

#include "game_interface.h"


#include "SDL.h"
#include "SDL_keycode.h"

static float forwardmove, sidemove; //Joystick mode
static float look_pitch_mouse,look_pitch_abs,look_pitch_joy;
static float look_yaw_mouse,look_yaw_joy;

void Host_Main(void);
void PortableInit(int argc,const char ** argv)
{
	LOGI("PortableInit");

	com_argc = argc;
	com_argv = (const char **)argv;
	Sys_ProvideSelfFD();

	SDL_Init(0);

	Host_Main();
}


//extern void Android_OnMouse( int androidButton, int action, float x, float y);


extern int SDL_SendKeyboardKey(Uint8 state, SDL_Scancode scancode);

int PortableKeyEvent(int state, int code ,int unitcode)
{
	//LOGI("PortableKeyEvent %d %d",state,code);

    if (state)
        SDL_SendKeyboardKey(SDL_PRESSED, (SDL_Scancode)code);
    else
        SDL_SendKeyboardKey(SDL_RELEASED, (SDL_Scancode) code);

	return 0;
}
void KeyUpPort (kbutton_t *b)
{
	b->state = 4; 		// impulse up
}
void KeyDownPort (kbutton_t *b)
{
	b->state |= 1 + 2; // down + impulse down
}
extern kbutton_t	in_mlook, in_klook;
extern kbutton_t	in_left, in_right, in_forward, in_back;
extern kbutton_t	in_lookup, in_lookdown, in_moveleft, in_moveright;
extern kbutton_t	in_strafe, in_speed, in_use, in_jump, in_attack;
extern kbutton_t	in_up, in_down;
// LordHavoc: added 6 new buttons
extern kbutton_t	in_button3, in_button4, in_button5, in_button6, in_button7, in_button8;
//even more
extern kbutton_t	in_button9, in_button10, in_button11, in_button12, in_button13, in_button14, in_button15, in_button16;


static int scoresShown = 0;
void PortableAction(int state, int action)
{
	LOGI("PortableAction %d %d",state, action);

	if ((action >= PORT_ACT_CUSTOM_0) && (action <= PORT_ACT_CUSTOM_17))
    {
        PortableKeyEvent(state, SDL_SCANCODE_H + action - PORT_ACT_CUSTOM_0, 0);
    }

	if (( PortableGetScreenMode() == TS_MENU ) || ( PortableGetScreenMode() == TS_BLANK )  || ( PortableGetScreenMode() == TS_Y_N ))
    {
        if (action >= PORT_ACT_MENU_UP && action <= PORT_ACT_MENU_ABORT)
        {
            int sdl_code [] = { SDL_SCANCODE_UP, SDL_SCANCODE_DOWN, SDL_SCANCODE_LEFT,
                    SDL_SCANCODE_RIGHT, SDL_SCANCODE_RETURN, SDL_SCANCODE_ESCAPE, SDL_SCANCODE_Y, SDL_SCANCODE_N };

            PortableKeyEvent(state, sdl_code[action-PORT_ACT_MENU_UP], 0);

            return;
        }
        else if( action == PORT_ACT_CONSOLE )
        {
            if (state)
               PortableCommand("toggleconsole");
        }
        else if( action ==  PORT_ACT_ATTACK )
        {
            MouseButton(state, BUTTON_PRIMARY); // Need to use mouse for in-game menus
        }
    }
    else
    {
        switch (action)
        {
        case PORT_ACT_LEFT:
            (state)?KeyDownPort(&in_left):KeyUpPort(&in_left);
            break;
        case PORT_ACT_RIGHT:
            (state)?KeyDownPort(&in_right):KeyUpPort(&in_right);
            break;
        case PORT_ACT_FWD:
            (state)?KeyDownPort(&in_forward):KeyUpPort(&in_forward);
            break;
        case PORT_ACT_BACK:
            (state)?KeyDownPort(&in_back):KeyUpPort(&in_back);
            break;
        case PORT_ACT_LOOK_UP:
            (state)?KeyDownPort(&in_lookup):KeyUpPort(&in_lookup);
            break;
        case PORT_ACT_LOOK_DOWN:
            (state)?KeyDownPort(&in_lookdown):KeyUpPort(&in_lookdown);
            break;
        case PORT_ACT_MOVE_LEFT:
            (state)?KeyDownPort(&in_moveleft):KeyUpPort(&in_moveleft);
            break;
        case PORT_ACT_MOVE_RIGHT:
            (state)?KeyDownPort(&in_moveright):KeyUpPort(&in_moveright);
            break;
        case PORT_ACT_STRAFE:
            (state)?KeyDownPort(&in_strafe):KeyUpPort(&in_strafe);
            break;
        case PORT_ACT_SPEED:
            (state)?KeyDownPort(&in_speed):KeyUpPort(&in_speed);
            break;
        case PORT_WRATH_USE:
            (state)?KeyDownPort(&in_button5):KeyUpPort(&in_button5); // Use in_button5
            break;
        case PORT_ACT_JUMP:
            (state)?KeyDownPort(&in_jump):KeyUpPort(&in_jump);
            break;
        case PORT_ACT_ATTACK:
            //(state)?KeyDownPort(&in_attack):KeyUpPort(&in_attack);
            MouseButton(state, BUTTON_PRIMARY); // Need to use mouse for in-game menus
            break;
        case PORT_ACT_UP:
            (state)?KeyDownPort(&in_up):KeyUpPort(&in_up);
            break;
        case PORT_ACT_DOWN:
            (state)?KeyDownPort(&in_button4):KeyUpPort(&in_button4); // Crouch in_button4
            break;
        case PORT_ACT_ALT_ATTACK:
            (state)?KeyDownPort(&in_button3):KeyUpPort(&in_button3);
            break;
        case PORT_ACT_WEAP1:
            if ( state )
                PortableCommand("impulse 1\n");
            break;
        case PORT_ACT_WEAP2:
            if ( state )
                PortableCommand("impulse 2\n");
            break;
        case PORT_ACT_WEAP3:
            if ( state )
                PortableCommand("impulse 3\n");
            break;
        case PORT_ACT_WEAP4:
            if ( state )
                PortableCommand("impulse 4\n");
            break;
        case PORT_ACT_WEAP5:
            if ( state )
                PortableCommand("impulse 5\n");
            break;
        case PORT_ACT_WEAP6:
            if ( state )
                PortableCommand("impulse 6\n");
            break;
        case PORT_ACT_WEAP7:
            if ( state )
                PortableCommand("impulse 7\n");
            break;
        case PORT_ACT_WEAP8:
            if ( state )
                PortableCommand("impulse 8\n");
            break;
		case PORT_ACT_WEAP0:
			if ( state )
				PortableCommand("impulse 0\n");
			break;
		case PORT_ACT_WEAP9:
			if ( state )
				PortableCommand("impulse 9\n");
			break;
        case PORT_ACT_NEXT_WEP:
            if (state)
                PortableCommand("impulse 55\n");
            break;
        case PORT_ACT_PREV_WEP:
            if (state)
                PortableCommand("impulse 56\n");
            break;
        case PORT_ACT_QUICKSAVE:
            if (state)
                PortableCommand("impulse 81\n");
            break;
        case PORT_ACT_QUICKLOAD:
            if (state)
                PortableCommand("impulse 89\n");
            break;
        case PORT_ACT_HELPCOMP: // Notebook
            if (state)
                PortableCommand("impulse 35\n");
            break;
        case PORT_ACT_INVEN: // Open runes
            (state)?KeyDownPort(&in_button6):KeyUpPort(&in_button6);
            break;
        case PORT_ACT_INVUSE: // Use artifacts
            if (state)
                PortableCommand("impulse 15\n");
            break;
        case PORT_ACT_CONSOLE:
            if (state)
                PortableCommand("toggleconsole");
            break;
        }
	}
}

static const char * quickCommand = 0;
void PortableCommand(const char * cmd)
{
	static char cmdBuffer[256];
	dpsnprintf(cmdBuffer, 256, "%s\n", cmd);
	quickCommand = cmdBuffer;
}



extern	keydest_t	key_dest;
touchscreemode_t PortableGetScreenMode()
{
	if ((key_dest != key_game) || key_consoleactive)
		return TS_MENU;
	else
	{
		if (cl.intermission || cls.demoplayback)
			return TS_BLANK;
		else
			return TS_GAME;
	}
}

int PortableShowKeyboard()
{
	//LOGI("key_dest = %d",key_dest);
	if (key_dest == key_console || key_dest == key_message || (key_dest == key_game && cls.state == ca_disconnected) || key_consoleactive)
		return 1;
	else
		return 0;
}

void PortableBackButton()
{
    LOGI("Back button");
    PortableKeyEvent(1, SDL_SCANCODE_ESCAPE,0 );
    PortableKeyEvent(0, SDL_SCANCODE_ESCAPE, 0);
}


// =================== FORWARD and SIDE MOVMENT ==============

void PortableMoveFwd(float fwd)
{
	if (fwd > 1)
		fwd = 1;
	else if (fwd < -1)
		fwd = -1;

	forwardmove = fwd;
}

void PortableMoveSide(float strafe)
{
	if (strafe > 1)
		strafe = 1;
	else if (strafe < -1)
		strafe = -1;

	sidemove = strafe;
}

void PortableMove(float fwd, float strafe)
{
	PortableMoveFwd(fwd);
	PortableMoveSide(strafe);
}

//======================================================================

//Look up and down
void PortableLookPitch(int mode, float pitch)
{
	switch(mode)
	{
	case LOOK_MODE_MOUSE:
		look_pitch_mouse += pitch;
		break;
	case LOOK_MODE_ABSOLUTE:
		look_pitch_abs = pitch;
		break;
	case LOOK_MODE_JOYSTICK:
		look_pitch_joy = pitch;
		break;
	}
}

//left right
void PortableLookYaw(int mode, float yaw)
{
	switch(mode)
	{
	case LOOK_MODE_MOUSE:
		look_yaw_mouse += yaw;
		break;
	case LOOK_MODE_JOYSTICK:
		look_yaw_joy = yaw;
		break;
	}
}

/////////////////////
// Movement handling
////


void IN_Move_Android( void )
{
	if (quickCommand)
	{
		LOGI("CMD = %s", quickCommand);
		Cmd_ExecuteString(quickCommand, src_command, true);
		quickCommand = 0;
	}

    int blockGamepad( void );
    int blockMove = blockGamepad() & ANALOGUE_AXIS_FWD;
    int blockLook = blockGamepad() & ANALOGUE_AXIS_PITCH;


    if( !blockMove )
    {
	    cl.cmd.forwardmove  += forwardmove * 400;
	    cl.cmd.sidemove  += sidemove   * 400;
    }

    if( !blockLook )
    {
        void MouseMove(float dx, float dy);
        MouseMove(look_yaw_mouse * 4000, look_pitch_mouse * 2000);
        look_pitch_mouse = 0;
        look_yaw_mouse = 0;

        float joyMouseX = look_yaw_joy  * (cl.realframetime * 1000.f / 16.f);
        float joyMouseY = -look_pitch_joy * (cl.realframetime * 1000.f / 16.f);
        MouseMove(joyMouseX * 40, joyMouseY * 20);
        /*
        cl.viewangles[0] -= look_pitch_mouse * 200;
        look_pitch_mouse = 0;
        cl.viewangles[0] += look_pitch_joy * 6 * (cl.realframetime * 1000.f / 16.f); // Presume was scaled at 60FPS

        cl.viewangles[1] += look_yaw_mouse * 300;
        look_yaw_mouse = 0;
        cl.viewangles[1] += look_yaw_joy * 6 * (cl.realframetime * 1000.f / 16.f);
         */

    }

	if (cl.viewangles[0] > 80)
		cl.viewangles[0] = 80;
	if (cl.viewangles[0]< -70)
		cl.viewangles[0] = -70;
}







