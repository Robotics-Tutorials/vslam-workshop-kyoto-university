echo "Configuring and building Thirdparty/DBoW2 ..."

cd Thirdparty/DBoW2
cmake -B build -G Ninja
cmake --build build -j $(nproc) --config Release

cd ../g2o

echo "Configuring and building Thirdparty/g2o ..."

cmake -B build -G Ninja
cmake --build build -j $(nproc) --config Release

cd ../Sophus

echo "Configuring and building Thirdparty/Sophus ..."

cmake -B build -G Ninja -DBUILD_TESTS=OFF -DBUILD_EXAMPLES=OFF
cmake --build build -j $(nproc) --config Release

cd ../../

echo "Uncompress vocabulary ..."

cd Vocabulary
tar -xf ORBvoc.txt.tar.gz
cd ..

echo "Configuring and building ORB_SLAM3 ..."

cmake -B build -G Ninja
cmake --build build -j $(nproc) --config Release
