function Av = meanValueAnalysis()
m = 6; % No of agents at each station and depend on the number of cars present at any given point in time
service_time = [0.2, 0.5, 1];
arrivalRate = [4, 5, 6]; %can be found out by utilization of the station/Service time
Av = zeros(m);
%A = zeros(m);
wait_time = zeros(m);
L = zeros(m); %mean queue length
sum = 0;
lambda = [4,3,2];
%Mean value Analysis
for n = 1:m-1 %Iterating for all the agents
        for i = 1:3 %for each node
            wait_time(i,n+1) = service_time(i)*(1+L(i,n)); %wait time computation
            sum = sum + arrivalRate(i)*wait_time(i,n+1);
        end
        for j = 1:3
            L(j,n+1) = (n)*(wait_time(j,n+1)*arrivalRate(j))/sum; % Average queue length computation
        end
end
for i = 1:3
    for n = 1:m-1
        Av(i,n) = L(i,n+1)/wait_time(i,n+1)*lambda(i);%Availability at each node 
        
    end
end

subplot(3,1,1);
plot(Av(1:m),'r')
title('Availability for node 1')

subplot(3,1,2);
plot(Av(2:m),'g')
title('Availability for node 2')

subplot(3,1,3);
plot(Av(3:m),'b')
title('Availability for node 3')



    