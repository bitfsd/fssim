cd ~/.gazebo/
ls
mkdir -p models
ls
cd models/
wget http://file.ncnynl.com/ros/gazebo_models.txt
ls
wget -i gazebo_models.txt
ls model.tar.g* | xargs -n1 tar xzvf
