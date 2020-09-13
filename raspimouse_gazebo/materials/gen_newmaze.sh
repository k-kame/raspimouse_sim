#!/bin/bash

WORKINGDIR="$HOME/catkin_ws/src/raspimouse_sim/raspimouse_gazebo"

if [ $# -ne 1 ]; then
    echo "Error: specify the file name of .world"
    exit 1
fi

./gen_mousemaze.py > tmp_maze.txt
cat ./maze_world_xacor_head.txt tmp_maze.txt > $1.world.xacro
rm tmp_maze.txt

rosrun xacro xacro $WORKINGDIR/materials/$1.world.xacro > $WORKINGDIR/worlds/$1.world
