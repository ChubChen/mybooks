%% 灰色预测公司的利润
%《量化投资：数据挖掘技术与实践》第9章配套程序，电子工业出版社，卓金武等编著，70263215@qq.com 
%% 程序主体
clear
syms a b;
c=[a b]';
A=[89677,99215,109655,120333,135823,159878,182321,209407,246619,300670];
B=cumsum(A);  % 原始数据累加
n=length(A);
for i=1:(n-1)
    C(i)=(B(i)+B(i+1))/2;  % 生成累加矩阵
end
% 计算待定参数的值
D=A;D(1)=[];
D=D';
E=[-C;ones(1,n-1)];
c=inv(E*E')*E*D;
c=c';
a=c(1);b=c(2);
% 预测后续数据
F=[];F(1)=A(1);
for i=2:(n+10)
    F(i)=(A(1)-b/a)/exp(a*(i-1))+b/a ;
end
G=[];G(1)=A(1);
for i=2:(n+10)
    G(i)=F(i)-F(i-1); %得到预测出来的数据
end 
t1=1999:2008;
t2=1999:2018;
G
plot(t1,A,'ko', 'LineWidth',2)
hold on
plot(t2,G,'k', 'LineWidth',2)
xlabel('年份', 'fontsize',12)
ylabel('利润/(元/年)','fontsize',12)
set(gca,  'LineWidth',2);

