echo Welcome to Display Setup Utility
read -p "Choose a option `echo '\n '`1. HDMI LEFT `echo '\n '`2. HDMI RIGHT `echo '\n '`3. DISABLE HDMI OUTPUT `echo '\n '`4. DISPLAY ONLY AT HDMI `echo '\n '`5. ENABLE BUILT_IN DISPLAY AND RERUN THE UTILITY`echo '\n '`6. Set HDMI as PRIMARY DISPLAY `echo '\n '`7. Set BUILT_IN DISPLAY AS PRIMARY`echo '\n '`" OPTION
D_OPTION=$(echo "${OPTION}" | cut -c1)
E_OPTION=$(echo "${OPTION}" | cut -c2)
case $D_OPTION in
	1*)
		echo HDMI WILL BE IN LEFT
		xrandr --output HDMI-0 --mode 1366x768 --pos 0x0
		xrandr --output eDP-1-1 --pos 1366x0 --primary
		;;
	2*)
		echo HDMI WILL BE IN RIGHT
		xrandr --output HDMI-0 --mode 1366x768 --pos 1920x0
		xrandr --output eDP-1-1 --pos 0x0 --primary
		;;
	3)
		echo HDMI OUTPUT WILL BE DISABLED
		xrandr --output HDMI-0 --off
		;;
	4)
		echo BUILT_IN DISPLAY WILL BE DISABLED
		xrandr --output eDP-1-1 --off
		;;
	5)
		echo "ENABLEING BUILT_IN DISPLAY IN AUTO MODE (!!Note You may have to re run this utility for a proper display configuration)"
		xrandr --output eDP-1-1 --auto
		my_display_setup.sh
		;;
	6)
		echo "Setting HDMI OUTPUT as Primary Display"
		xrandr --output HDMI-0 --primary
		;;
	7)
		echo "Setting BUILT_IN Display as Primary"
		xrandr --output eDP-1-1 --primary
		;;
	*)
		echo ENTER A VALD CHOICE
		;;
esac
case $E_OPTION in
	e*)
		echo "Exit"
		kill -9 $PPID
		exit 0
		;;
esac
read -p "Run this Utility again ??(y/n)" RUNAGAIN
case $RUNAGAIN in
	[yY])
		my_display_setup.sh
		;;
	*)
		exit
		;;
esac

