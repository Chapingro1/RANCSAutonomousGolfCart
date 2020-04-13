% Autonomous Golf Cart

rosshutdown
rosinit()

% creating all the nodes and topics
%% Nodes
node1 = ros.Node('/PedalNode');
node2 = ros.Node('/SteeringNode');
node3 = ros.Node('/BreakingNode');
node4 = ros.Node('/DataCollectionNode');
node5 = ros.Node('/AppNode');
node6 = ros.Node('/ModelNode');
node7 = ros.Node('/CartNode');

%% Topics
%publisers
%app pub
pub1a = ros.Publisher(node5,'/App/PedalPositionCommand','geometry_msgs/Twist');
pub2a = ros.Publisher(node5,'/App/SteeringPositionCommand','geometry_msgs/Twist');
pub3a = ros.Publisher(node5,'/App/BreakingPositionCommand','geometry_msgs/Twist');
%pub to App
pub1p = ros.Publisher(node1,'/App/CurrentPedalPosition','geometry_msgs/Twist');
pub1s = ros.Publisher(node2,'/App/CurrentSteeringPosition','geometry_msgs/Twist');
pub1b = ros.Publisher(node3,'/App/CurrentBreakingPosition','geometry_msgs/Twist');
%pub to model
pub2pm = ros.Publisher(node1,'/PedalPositionSend2m','geometry_msgs/Twist');
pub2sm = ros.Publisher(node2,'/SteeringPositionSend2m','geometry_msgs/Twist');
pub2bm = ros.Publisher(node3,'/BreakingPositionSend2m','geometry_msgs/Twist');
%pub to cart
pub2pc = ros.Publisher(node1,'/PedalPositionSend2c','geometry_msgs/Twist');
pub2sc = ros.Publisher(node2,'/SteeringPositionSend2c','geometry_msgs/Twist');
pub2bc = ros.Publisher(node3,'/BreakingPositionSend2c','geometry_msgs/Twist');

%---Model pub---------
pub1m = ros.Publisher(node6,'/Model/PedalPositionReturn','geometry_msgs/Twist');
pub2m = ros.Publisher(node6,'/Model/SteeringPositionReturn','geometry_msgs/Twist');
pub3m = ros.Publisher(node6,'/Model/BreakingPositionReturn','geometry_msgs/Twist');
pub4m = ros.Publisher(node6,'/Model/Acceleration','geometry_msgs/Twist');
pub5m = ros.Publisher(node6,'/Model/TireAngle','geometry_msgs/Twist');
pub6m = ros.Publisher(node6,'/Model/Camera','geometry_msgs/Twist');
%---Cart pub----------
pub1c = ros.Publisher(node7,'/Cart/PedalPositionReturn','geometry_msgs/Twist');
pub2c = ros.Publisher(node7,'/Cart/SteeringPositionReturn','geometry_msgs/Twist');
pub3c = ros.Publisher(node7,'/Cart/BreakingPositionReturn','geometry_msgs/Twist');
pub4c = ros.Publisher(node6,'/Cart/IMU/Acceleration','geometry_msgs/Twist');
pub5c = ros.Publisher(node6,'/Cart/TireAngle','geometry_msgs/Twist');
pub6c = ros.Publisher(node6,'/Cart/Camera','geometry_msgs/Twist');
%---------------------
%subscribers
%app sub
sub1a = ros.Subscriber(node5,'/App/CurrentPedalPosition','geometry_msgs/Twist');
sub2a = ros.Subscriber(node5,'/App/CurrentSteeringPosition','geometry_msgs/Twist');
sub3a = ros.Subscriber(node5,'/App/CurrentBreakingPosition','geometry_msgs/Twist');
%sub from App
sub1p = ros.Subscriber(node1,'/App/PedalPositionCommand','geometry_msgs/Twist');
sub1s = ros.Subscriber(node2,'/App/SteeringPositionCommand','geometry_msgs/Twist');
sub1b = ros.Subscriber(node3,'/App/BreakingPositionCommand','geometry_msgs/Twist');
%---sub from Model----
sub2p = ros.Subscriber(node1,'/Model/PedalPositionReturn','geometry_msgs/Twist');
sub2s = ros.Subscriber(node2,'/Model/SteeringPositionReturn','geometry_msgs/Twist');
sub2b = ros.Subscriber(node3,'/Model/BreakingPositionReturn','geometry_msgs/Twist');
%---sub from Cart-----
sub3p = ros.Subscriber(node1,'/Cart/PedalPositionReturn','geometry_msgs/Twist');
sub3s = ros.Subscriber(node2,'/Cart/SteeringPositionReturn','geometry_msgs/Twist');
sub3b = ros.Subscriber(node3,'/Cart/BreakingPositionReturn','geometry_msgs/Twist');
%---------------------------------------
%---Model sub---------
sub1m = ros.Subscriber(node6,'/PedalPositionSend2m','geometry_msgs/Twist');
sub2m = ros.Subscriber(node6,'/SteeringPositionSend2m','geometry_msgs/Twist');
sub3m = ros.Subscriber(node6,'/BreakingPositionSend2m','geometry_msgs/Twist');
%---Cart sub----------
sub1c = ros.Subscriber(node7,'/PedalPositionSend2c','geometry_msgs/Twist');
sub2c = ros.Subscriber(node7,'/SteeringPositionSend2c','geometry_msgs/Twist');
sub3c = ros.Subscriber(node7,'/BreakingPositionSend2c','geometry_msgs/Twist');
%---------------------------------------
%datacollection sub
sub1d = ros.Subscriber(node4,'/Model/PedalPositionReturn','geometry_msgs/Twist');
sub2d = ros.Subscriber(node4,'/Model/SteeringPositionReturn','geometry_msgs/Twist');
sub3d = ros.Subscriber(node4,'/Model/BreakingPositionReturn','geometry_msgs/Twist');
sub7d = ros.Subscriber(node4,'/Model/Acceleration','geometry_msgs/Twist');
sub8d = ros.Subscriber(node4,'/Model/TireAngle','geometry_msgs/Twist');
sub9d = ros.Subscriber(node4,'/Model/Camera','geometry_msgs/Twist');
sub10d = ros.Subscriber(node4,'/Cart/PedalPositionReturn','geometry_msgs/Twist');
sub11d = ros.Subscriber(node4,'/Cart/SteeringPositionReturn','geometry_msgs/Twist');
sub12d = ros.Subscriber(node4,'/Cart/BreakingPositionReturn','geometry_msgs/Twist');
sub13d = ros.Subscriber(node4,'/Cart/IMU/Acceleration','geometry_msgs/Twist');
sub14d = ros.Subscriber(node4,'/Cart/TireAngle','geometry_msgs/Twist');
sub15d = ros.Subscriber(node4,'/Cart/Camera','geometry_msgs/Twist');
%%
