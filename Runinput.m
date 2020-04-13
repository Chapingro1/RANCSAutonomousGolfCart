
% input
pedalpos = 12; %example
steeringpos = 23; %example
breakingpos = 34; %example

%Crate message from app and publish it
pub1amsg =rosmessage(pub1a);
pub1amsg.Linear.X = pedalpos;
send(pub1a,pub1amsg);
pub2amsg = rosmessage(pub2a);
pub2amsg.Linear.X = steeringpos;
send(pub2a,pub2amsg);
pub3amsg =rosmessage(pub3a);
pub3amsg.Linear.X = breakingpos;
send(pub3a,pub3amsg);

% Recieve message from app
sub1pmsg = sub1p.LatestMessage;
sub1smsg = sub1s.LatestMessage;
sub1bmsg = sub1b.LatestMessage;

% (recived from app)Create message and publish it to model/cart
pub2pmsg = sub1pmsg;
pub2smsg = sub1smsg;
pub2bmsg = sub1bmsg;


%% switch between model/cart

mode = menu('Select model?','model','cart'); %display menu

switch (mode)
    case 1  %model
        tic;
        i=1;
        time=[];
        p2model=[];
        s2model=[];
        b2model=[];
        pfrommodel=[];
        sfrommodel=[];
        bfrommodel=[];
        %send message to model
        send(pub2pm,pub2pmsg);
        send(pub2sm,pub2smsg);
        send(pub2bm,pub2bmsg);
         
        while(toc<20)
            
            %model subscriber data
            p2model = sub1m.LatestMessage;
            p2ms(i) = p2model.Linear.X;
            s2model = sub2m.LatestMessage;
            s2ms(i) = s2model.Linear.X;
            b2model = sub3m.LatestMessage;
            b2ms(i) = b2model.Linear.X;
            
            %feedback model publish
            pfrommodel = sub2p.LatestMessage;
            sfrommodel = sub2s.LatestMessage;
            bfrommodel = sub2b.LatestMessage;
            time(i)=toc;
            i=i+1;
        end
        figure
        plot(p2ms)
        figure
        plot(s2ms)
        figure
        plot(b2ms)

    case 2  %cart
        send(pub2pc,pub2pmsg);
        send(pub2sc,pub2smsg);
        send(pub2bc,pub2bmsg);
end



