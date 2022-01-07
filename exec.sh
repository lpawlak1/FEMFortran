if [ -d build ]
then
    cd build/
    ./exec.out $1
else
    echo "Use make install to compile things first"
fi
