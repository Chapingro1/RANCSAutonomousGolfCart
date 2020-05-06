% testing
% input (app input example)
pedalpos = 12; %example
steeringpos = 23; %example
breakingpos = 34; %example

% Crate message from app and publish it
pub1amsg =rosmessage(pub1a);
pub1amsg.Linear.X = pedalpos;
send(pub1a,pub1amsg);
pub2amsg = rosmessage(pub2a);
pub2amsg.Linear.X = steeringpos;
send(pub2a,pub2amsg);
pub3amsg =rosmessage(pub3a);
pub3amsg.Linear.X = breakingpos;
send(pub3a,pub3amsg);

% get message from app
sub1pmsg = sub1p.LatestMessage;
sub1smsg = sub1s.LatestMessage;
sub1bmsg = sub1b.LatestMessage;

% set the message
pub2pmsg = sub1pmsg;
pub2smsg = sub1smsg;
pub2bmsg = sub1bmsg;

% send message to model
send(pub2pm,pub2pmsg);
send(pub2sm,pub2smsg);
send(pub2bm,pub2bmsg);

% publish to model
% start clock
tic;
i=1;
% set empty array
time=[];
p2model=[];
s2model=[];
b2model=[];
pfrommodel=[];
sfrommodel=[];
bfrommodel=[];

while(toc<20)
    % run 20 sec and model node receives the data
    p2model = sub1m.LatestMessage;
    p2ms(i) = p2model.Linear.X;
    s2model = sub2m.LatestMessage;
    s2ms(i) = s2model.Linear.X;
    b2model = sub3m.LatestMessage;
    b2ms(i) = b2model.Linear.X;
   
    time(i)=toc;
    i=i+1;
end
%plot the data, the model recieve
figure
plot(p2ms)
figure
plot(s2ms)
figure
plot(b2ms)