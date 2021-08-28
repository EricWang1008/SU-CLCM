%% (Robust-RBF): Multi-Kernel Fusion for RBF NN
% Author: SHUJAAT KHAN, shujaat123@gmail.com
clc
clear
%{
load Letter.mat

l1 = size(A,1);
l2 = size(B,1);
l3 = size(C,1);
l4 = size(D,1);
l5 = size(E,1);
l6 = size(F,1);
l7 = size(G,1);
l8 = size(H,1);
l9 = size(I,1);
l10 = size(J,1);
l11 = size(K,1);
l12 = size(L,1);
l13 = size(M,1);
l14 = size(N,1);
l15 = size(O,1);
l16 = size(P,1);
l17 = size(Q,1);
l18 = size(R,1);
l19 = size(S,1);
l20 = size(T,1);
l21 = size(U,1);
l22 = size(V,1);
l23 = size(W,1);
l24 = size(X,1);
l25 = size(Y,1);
l26 = size(Z,1);
DD1 = [A';ones(1,l1)]';
DD2 = [B';2*ones(1,l2)]';
DD3 = [C';3*ones(1,l3)]';
DD4 = [D';4*ones(1,l4)]';
DD5 = [E';5*ones(1,l5)]';
DD6 = [F';6*ones(1,l6)]';
DD7 = [G';7*ones(1,l7)]';
DD8 = [H';8*ones(1,l8)]';
DD9 = [I';9*ones(1,l9)]';
DD10 = [J';10*ones(1,l10)]';
DD11 = [K';11*ones(1,l11)]';
DD12 = [L';12*ones(1,l12)]';
DD13 = [M';13*ones(1,l13)]';
DD14 = [N';14*ones(1,l14)]';
DD15 = [O';15*ones(1,l15)]';
DD16 = [P';16*ones(1,l16)]';
DD17 = [Q';17*ones(1,l17)]';
DD18 = [R';18*ones(1,l18)]';
DD19 = [S';19*ones(1,l19)]';
DD20 = [T';20*ones(1,l20)]';
DD21 = [U';21*ones(1,l21)]';
DD22 = [V';22*ones(1,l22)]';
DD23 = [W';23*ones(1,l23)]';
DD24 = [X';24*ones(1,l24)]';
DD25 = [Y';25*ones(1,l25)]';
DD26 = [Z';26*ones(1,l26)]';
DD = [DD1;DD2;DD3;DD4;DD5;DD6;DD7;DD8;DD9;DD10;DD11;DD12;DD13;DD14;DD15;DD16;DD17;DD18;DD19;DD20;DD21;DD22;DD23;DD24;DD25;DD26];
C1=find(DD(:,end)==1);
C2=find(DD(:,end)==2);
C3=find(DD(:,end)==3);
C4=find(DD(:,end)==4);
C5=find(DD(:,end)==5);
C6=find(DD(:,end)==6);
C7=find(DD(:,end)==7);
C8=find(DD(:,end)==8);
C9=find(DD(:,end)==9);
C10=find(DD(:,end)==10);
C11=find(DD(:,end)==11);
C12=find(DD(:,end)==12);
C13=find(DD(:,end)==13);
C14=find(DD(:,end)==14);
C15=find(DD(:,end)==15);
C16=find(DD(:,end)==16);
C17=find(DD(:,end)==17);
C18=find(DD(:,end)==18);
C19=find(DD(:,end)==19);
C20=find(DD(:,end)==20);
C21=find(DD(:,end)==21);
C22=find(DD(:,end)==22);
C23=find(DD(:,end)==23);
C24=find(DD(:,end)==24);
C25=find(DD(:,end)==25);
C26=find(DD(:,end)==26);
ll1 = ceil(l1*0.05);
ll2 = ceil(l2*0.05);
ll3 = ceil(l3*0.05);
ll4 = ceil(l4*0.05);
ll5 = ceil(l5*0.05);
ll6 = ceil(l6*0.05);
ll7 = ceil(l7*0.05);
ll8 = ceil(l8*0.05);
ll9 = ceil(l9*0.05);
ll10 = ceil(l10*0.05);
ll11 = ceil(l11*0.05);
ll12 = ceil(l12*0.05);
ll13 = ceil(l13*0.05);
ll14 = ceil(l14*0.05);
ll15 = ceil(l15*0.05);
ll16 = ceil(l16*0.05);
ll17 = ceil(l17*0.05);
ll18 = ceil(l18*0.05);
ll19 = ceil(l19*0.05);
ll20 = ceil(l20*0.05);
ll21 = ceil(l21*0.05);
ll22 = ceil(l22*0.05);
ll23 = ceil(l23*0.05);
ll24 = ceil(l24*0.05);
ll25 = ceil(l25*0.05);
ll26 = ceil(l26*0.05);
train_ind=[C1(1:ll1);C2(1:ll2);C3(1:ll3);C4(1:ll4);C5(1:ll5);C6(1:ll6);C7(1:ll7);C8(1:ll8);C9(1:ll9);C10(1:ll10);C11(1:ll11);C12(1:ll12);C13(1:ll13);C14(1:ll14);C15(1:ll15);C16(1:ll16);C17(1:ll17);C18(1:ll18);C19(1:ll19);C20(1:ll20);C21(1:ll21);C22(1:ll22);C23(1:ll23);C24(1:ll24);C25(1:ll25);C26(1:ll26)];
test_ind=[C1(ll1+1:end);C2(ll2+1:end);C3(ll3+1:end);C4(ll4+1:end);C5(ll5+1:end);C6(ll6+1:end);C7(ll7+1:end);C8(ll8+1:end);C9(ll9+1:end);C10(ll10+1:end);C11(ll11+1:end);C12(ll12+1:end);C13(ll13+1:end);C14(ll14+1:end);C15(ll15+1:end);C16(ll16+1:end);C17(ll17+1:end);C18(ll18+1:end);C19(ll19+1:end);C20(ll20+1:end);C21(ll21+1:end);C22(ll22+1:end);C23(ll23+1:end);C24(ll24+1:end);C25(ll25+1:end);C26(ll26+1:end)];
%}
%{
load Vowel.mat

l1 = size(A,1);
l2 = size(B,1);
l3 = size(C,1);
l4 = size(D,1);
l5 = size(E,1);
l6 = size(F,1);
l7 = size(G,1);
l8 = size(H,1);
l9 = size(I,1);
l10 = size(J,1);
l11 = size(K,1);
DD1 = [A';ones(1,l1)]';
DD2 = [B';2*ones(1,l2)]';
DD3 = [C';3*ones(1,l3)]';
DD4 = [D';4*ones(1,l4)]';
DD5 = [E';5*ones(1,l5)]';
DD6 = [F';6*ones(1,l6)]';
DD7 = [G';7*ones(1,l7)]';
DD8 = [H';8*ones(1,l8)]';
DD9 = [I';9*ones(1,l9)]';
DD10 = [J';10*ones(1,l10)]';
DD11 = [K';11*ones(1,l11)]';
DD = [DD1;DD2;DD3;DD4;DD5;DD6;DD7;DD8;DD9;DD10;DD11];
C1=find(DD(:,end)==1);
C2=find(DD(:,end)==2);
C3=find(DD(:,end)==3);
C4=find(DD(:,end)==4);
C5=find(DD(:,end)==5);
C6=find(DD(:,end)==6);
C7=find(DD(:,end)==7);
C8=find(DD(:,end)==8);
C9=find(DD(:,end)==9);
C10=find(DD(:,end)==10);
C11=find(DD(:,end)==11);
ll1 = ceil(l1*0.05);
ll2 = ceil(l2*0.05);
ll3 = ceil(l3*0.05);
ll4 = ceil(l4*0.05);
ll5 = ceil(l5*0.05);
ll6 = ceil(l6*0.05);
ll7 = ceil(l7*0.05);
ll8 = ceil(l8*0.05);
ll9 = ceil(l9*0.05);
ll10 = ceil(l10*0.05);
ll11 = ceil(l11*0.05);
train_ind=[C1(1:ll1);C2(1:ll2);C3(1:ll3);C4(1:ll4);C5(1:ll5);C6(1:ll6);C7(1:ll7);C8(1:ll8);C9(1:ll9);C10(1:ll10);C11(1:ll11)];
test_ind=[C1(ll1+1:end);C2(ll2+1:end);C3(ll3+1:end);C4(ll4+1:end);C5(ll5+1:end);C6(ll6+1:end);C7(ll7+1:end);C8(ll8+1:end);C9(ll9+1:end);C10(ll10+1:end);C11(ll11+1:end)];
%}
%{
load wine.mat

l1 = size(One,1);
l2 = size(Two,1);
l3 = size(Thr,1);
DD1 = [One';ones(1,l1)]';
DD2 = [Two';2*ones(1,l2)]';
DD3 = [Thr';3*ones(1,l3)]';
DD = [DD1;DD2;DD3];
C1=find(DD(:,end)==1);
C2=find(DD(:,end)==2);
C3=find(DD(:,end)==3);
ll1 = ceil(l1*0.05);
ll2 = ceil(l2*0.05);
ll3 = ceil(l3*0.05);
train_ind=[C1(1:ll1);C2(1:ll2);C3(1:ll3)];
test_ind=[C1(ll1+1:end);C2(ll2+1:end);C3(ll3+1:end)];
%}
%{
load waveform.mat

l1 = size(A,1);
l2 = size(B,1);
l3 = size(C,1);
DD1 = [A';ones(1,l1)]';
DD2 = [B';2*ones(1,l2)]';
DD3 = [C';3*ones(1,l3)]';
DD = [DD1;DD2;DD3];
C1=find(DD(:,end)==1);
C2=find(DD(:,end)==2);
C3=find(DD(:,end)==3);
ll1 = ceil(l1*0.05);
ll2 = ceil(l2*0.05);
ll3 = ceil(l3*0.05);
train_ind=[C1(1:ll1);C2(1:ll2);C3(1:ll3)];
test_ind=[C1(ll1+1:end);C2(ll2+1:end);C3(ll3+1:end)];
%}
%{
load Vehicle.mat

l1 = size(bus,1);
l2 = size(opel,1);
l3 = size(saab,1);
l4 = size(van,1);
DD1 = [bus';ones(1,l1)]';
DD2 = [opel';2*ones(1,l2)]';
DD3 = [saab';3*ones(1,l3)]';
DD4 = [van';4*ones(1,l4)]';
DD = [DD1;DD2;DD3;DD4];
C1=find(DD(:,end)==1);
C2=find(DD(:,end)==2);
C3=find(DD(:,end)==3);
C4=find(DD(:,end)==4);
ll1 = ceil(l1*0.05);
ll2 = ceil(l2*0.05);
ll3 = ceil(l3*0.05);
ll4 = ceil(l4*0.05);
train_ind=[C1(1:ll1);C2(1:ll2);C3(1:ll3);C4(1:ll4)];
test_ind=[C1(ll1+1:end);C2(ll2+1:end);C3(ll3+1:end);C4(ll4+1:end)];
%}
%{
load Spambase.mat

l1 = size(One,1);
l2 = size(Zero,1);
DD1 = [One';ones(1,l1)]';
DD2 = [Zero';2*ones(1,l2)]';
DD = [DD1;DD2];
neg_ind=find(DD(:,end)==1);
neu_ind=find(DD(:,end)==2);
ll1 = ceil(l1*0.05);
ll2 = ceil(l2*0.05);
train_ind=[neg_ind(1:ll1);neu_ind(1:ll2)];
test_ind=[neg_ind(ll1+1:end);neu_ind(ll2+1:end)];
%}
%{
load Sonar.mat

l1 = size(R,1);
l2 = size(M,1);
DD1 = [R';ones(1,l1)]';
DD2 = [M';2*ones(1,l2)]';
DD = [DD1;DD2];
neg_ind=find(DD(:,end)==1);
neu_ind=find(DD(:,end)==2);
ll1 = ceil(l1*0.05);
ll2 = ceil(l2*0.05);
train_ind=[neg_ind(1:ll1);neu_ind(1:ll2)];
test_ind=[neg_ind(ll1+1:end);neu_ind(ll2+1:end)];
%}
%{
load segment.mat

l1 = size(Br,1);
l2 = size(Ce,1);
l3 = size(Fo,1);
l4 = size(Gr,1);
l5 = size(Pa,1);
l6 = size(Sk,1);
l7 = size(Wi,1);
DD1 = [Br';ones(1,l1)]';
DD2 = [Ce';2*ones(1,l2)]';
DD3 = [Fo';3*ones(1,l3)]';
DD4 = [Gr';4*ones(1,l4)]';
DD5 = [Pa';5*ones(1,l5)]';
DD6 = [Sk';6*ones(1,l6)]';
DD7 = [Wi';7*ones(1,l7)]';
DD = [DD1;DD2;DD3;DD4;DD5;DD6;DD7];
C1=find(DD(:,end)==1);
C2=find(DD(:,end)==2);
C3=find(DD(:,end)==3);
C4=find(DD(:,end)==4);
C5=find(DD(:,end)==5);
C6=find(DD(:,end)==6);
C7=find(DD(:,end)==7);
ll1 = ceil(l1*0.05);
ll2 = ceil(l2*0.05);
ll3 = ceil(l3*0.05);
ll4 = ceil(l4*0.05);
ll5 = ceil(l5*0.05);
ll6 = ceil(l6*0.05);
ll7 = ceil(l7*0.05);
train_ind=[C1(1:ll1);C2(1:ll2);C3(1:ll3);C4(1:ll4);C5(1:ll5);C6(1:ll6);C7(1:ll7)];
test_ind=[C1(ll1+1:end);C2(ll2+1:end);C3(ll3+1:end);C4(ll4+1:end);C5(ll5+1:end);C6(ll6+1:end);C7(ll7+1:end)];
%}
%
load nursery.mat

l1 = size(NR,1);
l2 = size(P,1);
l3 = size(R,1);
l4 = size(SP,1);
l5 = size(VR,1);
DD1 = [NR';ones(1,l1)]';
DD2 = [P';2*ones(1,l2)]';
DD3 = [R';3*ones(1,l3)]';
DD4 = [SP';4*ones(1,l4)]';
DD5 = [VR';5*ones(1,l5)]';
DD = [DD1;DD2;DD3;DD4;DD5];
C1=find(DD(:,end)==1);
C2=find(DD(:,end)==2);
C3=find(DD(:,end)==3);
C4=find(DD(:,end)==4);
C5=find(DD(:,end)==5);
ll1 = ceil(l1*0.05);
ll2 = ceil(l2*0.05);
ll3 = ceil(l3*0.05);
ll4 = ceil(l4*0.05);
ll5 = ceil(l5*0.05);
train_ind=[C1(1:ll1);C2(1:ll2);C3(1:ll3);C4(1:ll4);C5(1:ll5)];
test_ind=[C1(ll1+1:end);C2(ll2+1:end);C3(ll3+1:end);C4(ll4+1:end);C5(ll5+1:end)];
%}
%{
load monk3.mat

l1 = size(Tr1,1);
l2 = size(Tr2,1);
DD1 = [Tr1';ones(1,l1)]';
DD2 = [Tr2';2*ones(1,l2)]';
DD = [DD1;DD2];
neg_ind=find(DD(:,end)==1);
neu_ind=find(DD(:,end)==2);
ll1 = ceil(l1*0.05);
ll2 = ceil(l2*0.05);
train_ind=[neg_ind(1:ll1);neu_ind(1:ll2)];
test_ind=[neg_ind(ll1+1:end);neu_ind(ll2+1:end)];
%}
%{
load monk2.mat

l1 = size(Tr1,1);
l2 = size(Tr2,1);
DD1 = [Tr1';ones(1,l1)]';
DD2 = [Tr2';2*ones(1,l2)]';
DD = [DD1;DD2];
neg_ind=find(DD(:,end)==1);
neu_ind=find(DD(:,end)==2);
ll1 = ceil(l1*0.05);
ll2 = ceil(l2*0.05);
train_ind=[neg_ind(1:ll1);neu_ind(1:ll2)];
test_ind=[neg_ind(ll1+1:end);neu_ind(ll2+1:end)];
%}
%{
load monk1.mat

l1 = size(Tr1,1);
l2 = size(Tr2,1);
DD1 = [Tr1';ones(1,l1)]';
DD2 = [Tr2';2*ones(1,l2)]';
DD = [DD1;DD2];
neg_ind=find(DD(:,end)==1);
neu_ind=find(DD(:,end)==2);
ll1 = ceil(l1*0.05);
ll2 = ceil(l2*0.05);
train_ind=[neg_ind(1:ll1);neu_ind(1:ll2)];
test_ind=[neg_ind(ll1+1:end);neu_ind(ll2+1:end)];
%}
%{
load Lymphography.mat

l1 = size(A,1);
l2 = size(B,1);
l3 = size(C,1);
l4 = size(D,1);
DD1 = [A';ones(1,l1)]';
DD2 = [B';2*ones(1,l2)]';
DD3 = [C';3*ones(1,l3)]';
DD4 = [D';4*ones(1,l4)]';
DD = [DD1;DD2;DD3;DD4];
C1=find(DD(:,end)==1);
C2=find(DD(:,end)==2);
C3=find(DD(:,end)==3);
C4=find(DD(:,end)==4);
ll1 = ceil(l1*0.05);
ll2 = ceil(l2*0.05);
ll3 = ceil(l3*0.05);
ll4 = ceil(l4*0.05);
train_ind=[C1(1:ll1);C2(1:ll2);C3(1:ll3);C4(1:ll4)];
test_ind=[C1(ll1+1:end);C2(ll2+1:end);C3(ll3+1:end);C4(ll4+1:end)];
%}
%{
load kr-vs-kp.mat

l1 = size(win,1);
l2 = size(nowin,1);
DD1 = [win';ones(1,l1)]';
DD2 = [nowin';2*ones(1,l2)]';
DD = [DD1;DD2];
neg_ind=find(DD(:,end)==1);
neu_ind=find(DD(:,end)==2);
ll1 = ceil(l1*0.05);
ll2 = ceil(l2*0.05);
train_ind=[neg_ind(1:ll1);neu_ind(1:ll2)];
test_ind=[neg_ind(ll1+1:end);neu_ind(ll2+1:end)];
%}
%{
load Ionosphere.mat

l1 = size(B,1);
l2 = size(G,1);
DD1 = [B';ones(1,l1)]';
DD2 = [G';2*ones(1,l2)]';
DD = [DD1;DD2];
neg_ind=find(DD(:,end)==1);
neu_ind=find(DD(:,end)==2);
ll1 = ceil(l1*0.05);
ll2 = ceil(l2*0.05);
train_ind=[neg_ind(1:ll1);neu_ind(1:ll2)];
test_ind=[neg_ind(ll1+1:end);neu_ind(ll2+1:end)];
%}
%{
load Heart-statlog.mat

l1 = size(One,1);
l2 = size(Two,1);
DD1 = [One';ones(1,l1)]';
DD2 = [Two';2*ones(1,l2)]';
DD = [DD1;DD2];
neg_ind=find(DD(:,end)==1);
neu_ind=find(DD(:,end)==2);
ll1 = ceil(l1*0.05);
ll2 = ceil(l2*0.05);
train_ind=[neg_ind(1:ll1);neu_ind(1:ll2)];
test_ind=[neg_ind(ll1+1:end);neu_ind(ll2+1:end)];
%}
%{
load Haberman.mat

l1 = size(one,1);
l2 = size(two,1);
DD1 = [one';ones(1,l1)]';
DD2 = [two';2*ones(1,l2)]';
DD = [DD1;DD2];
neg_ind=find(DD(:,end)==1);
neu_ind=find(DD(:,end)==2);
ll1 = ceil(l1*0.05);
ll2 = ceil(l2*0.05);
train_ind=[neg_ind(1:ll1);neu_ind(1:ll2)];
test_ind=[neg_ind(ll1+1:end);neu_ind(ll2+1:end)];
%}
%{
load diabetes.mat

l1 = size(O,1);
l2 = size(Z,1);
DD1 = [O';ones(1,l1)]';
DD2 = [Z';2*ones(1,l2)]';
DD = [DD1;DD2];
neg_ind=find(DD(:,end)==1);
neu_ind=find(DD(:,end)==2);

train_ind=[neg_ind(1:14);neu_ind(1:25)];
test_ind=[neg_ind(15:end);neu_ind(26:end)];
%}
%{
load balance.mat 

l1 = size(B,1);
l2 = size(L,1);
l3 = size(R,1);
DD1 = [B';ones(1,l1)]';
DD2 = [L';2*ones(1,l2)]';
DD3 = [R';3*ones(1,l3)]';
DD = [DD1;DD2;DD3];
neg_ind=find(DD(:,end)==1);
neu_ind=find(DD(:,end)==2);
pos_ind=find(DD(:,end)==3);

train_ind=[neg_ind(1:3);neu_ind(1:15);pos_ind(1:15)];
test_ind=[neg_ind(4:end);neu_ind(16:end);pos_ind(16:end)];
%}
%{
load iris.mat  

l1 = size(Se,1);
l2 = size(Ve,1);
l3 = size(Vi,1);
DD1 = [Se';ones(1,l1)]';
DD2 = [Ve';2*ones(1,l2)]';
DD3 = [Vi';3*ones(1,l3)]';
DD = [DD1;DD2;DD3];
neg_ind=find(DD(:,end)==1);
neu_ind=find(DD(:,end)==2);
pos_ind=find(DD(:,end)==3);

train_ind=[neg_ind(1:3);neu_ind(1:3);pos_ind(1:3)];
test_ind=[neg_ind(4:end);neu_ind(4:end);pos_ind(4:end)];
%}
train_data=DD(train_ind,1:end-1);
test_data=DD(test_ind,1:end-1);
class_train=DD(train_ind,end)';
class_test=DD(test_ind,end)';

%{
load Data\Iris_Processed.csv  % Gene Expression Micro Array Data for Leukemia cancer by Golub 

neg_ind=find(Iris_Processed(:,end)==1);
neu_ind=find(Iris_Processed(:,end)==0);
pos_ind=find(Iris_Processed(:,end)==-1);

train_ind=[neg_ind(1:3);neu_ind(1:3);pos_ind(1:3)];
test_ind=[neg_ind(4:end);neu_ind(4:end);pos_ind(4:end)];

train_data=Iris_Processed(train_ind,1:end-1);
test_data=Iris_Processed(test_ind,1:end-1);
class_train=Iris_Processed(train_ind,end)';
class_test=Iris_Processed(test_ind,end)';
%}

train_data;
class_train;

[m1 ~] = size(train_data);

epoch=2000;
eta=5e-3;
interval=0.5;
beeta=2*interval;
runs=10;
[c] = subclust(train_data,0.2); 
n1 = size(c,1);

I=zeros(1,epoch);
alpha_final=0;
y_test_final=0;
for run=1:runs
run
w=randn(1,n1);
b=randn();
alpha =[0.5 0.5];
% I=0;

for k=1:epoch
%     I(k)=0;
    ind=1:m1;
    
    for i1=1:m1
        for i2=1:n1
            CD(1,i2)=(train_data(ind(i1),:)*c(i2,:)')/(norm(train_data(ind(i1),:))*norm(c(i2,:))+1e-50);
            ED(1,i2)=exp((-(norm(train_data(ind(i1),:)-c(i2,:))^2))/beeta^2);
            phi(1,i2)=alpha(1)*CD(1,i2) + alpha(2)*ED(1,i2);
        end
        y_train(i1)=w*phi(1,:)'+b;
        d(i1)=class_train(ind(i1));
        e=d(i1)-y_train(i1);
        I(k)=I(k)+e*e';   %%% Objective Function
          
        
        R=(abs(alpha(1))+abs(alpha(2)))^2;
        delta_temp=(eta*e*w*(CD'-ED'))*(abs(alpha(1))*abs(alpha(2)));
        
        alpha(1)=alpha(1)+((delta_temp)/(R*alpha(1)));
        alpha(2)=alpha(2)+((-delta_temp)/(R*alpha(2)));
        
        w=w+eta*e*phi(1,:);
        b=b+eta*e;
    end

    Rt=(abs(alpha(1))+abs(alpha(2)));
    alpha(1)=abs(alpha(1))./Rt;
    alpha(2)=abs(alpha(2))./Rt;
%     alpha=[alpha(1) alpha(2)];
    
end
Training_Accuracy(run)=100*(1-(length(find((round(y_train)-class_train(ind))~=0))/length(y_train)));

%% Testing
P=test_data;
f=class_test;

[m2 ~] = size(P);
ind = 1:m2;
for i1=1:m2
    for i2=1:n1
        CD=(test_data(ind(i1),:)*c(i2,:)')/(norm(test_data(ind(i1),:))*norm(c(i2,:))+1e-50);
        ED=exp((-(norm(test_data(ind(i1),:)-c(i2,:))^2))/beeta^2);
        phi(1,i2)=alpha(1)*CD + alpha(2)*ED;
    end
    y_test(i1)=w*phi(1,:)' + b;
end
y_test_final=y_test_final+y_test;
alpha_final=alpha_final+alpha;
Testing_Accuracy(run)=100*(1-(length(find((round(y_test)-class_test)~=0))/length(y_test)));
end
ACC = sum(Testing_Accuracy)/runs



