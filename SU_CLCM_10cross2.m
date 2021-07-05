clc
clear
%%

mingen = 6;          %The only parameter,the last rank of memory cell, not used for vaccine 

for j = 1 : 10
    j
        %1--Balance
        %{
    load balance.mat
    C = [B;L;R];
    C2 = tsne(C,'Algorithm','Exact','distance','cosine','perplexity',5);   %Dimension reduction
    D = normat(C2);
    n = size(D,1);
    A = 1 : n;
    D = [D';A]';
    D1 = D(1:49,:);
    D2 = D(50:337,:);
    D3 = D(338:625,:);
    l1 = size(D1,1);
    l2 = size(D2,1);
    l3 = size(D3,1);
    D1 = [D1';ones(1,l1)]';
    D2 = [D2';2.*ones(1,l2)]';
    D3 = [D3';3.*ones(1,l3)]';
    t01 = randperm(l1);
    t02 = randperm(l2);
    t03 = randperm(l3);
    BN = 3;
    Al = [];
    for i = 1 :10
        DD1 = D1;
        DD2 = D2;
        DD3 = D3;
        if i < 10
            Te1 = DD1(t01((i-1)*5+1:i*5),:);
            DD1(t01((i-1)*5+1:i*5),:) = [];
        else
            Te1 = DD1(t01(46:end),:);
            DD1(t01(46:end),:) = [];
        end
        if i <= 2
            Te2 = DD2(t02((i-1)*28+1:i*28),:);
            Te3 = DD3(t03((i-1)*28+1:i*28),:);
            DD2(t02((i-1)*28+1:i*28),:) = [];
            DD3(t03((i-1)*28+1:i*28),:) = [];
        end
        if i > 2 && i < 10
            Te2 = DD2(t02(56+(i-3)*29+1:56+(i-2)*29),:);
            Te3 = DD3(t03(56+(i-3)*29+1:56+(i-2)*29),:);
            DD2(t02(56+(i-3)*29+1:56+(i-2)*29),:) = [];
            DD3(t03(56+(i-3)*29+1:56+(i-2)*29),:) = [];
        end
        if i == 10
            Te2 = DD2(t02(260:end),:);
            Te3 = DD3(t03(260:end),:);
            DD2(t02(260:end),:) = [];
            DD3(t03(260:end),:) = [];
        end
        Tr1 = DD1;
        Tr2 = DD2;
        Tr3 = DD3;
        TrainData = [Tr1;Tr2;Tr3];
        TestData = [Te1;Te2;Te3];
        %}
        
        %2--diabetes
        %{
    load diabetes.mat
    C = [O;Z];
    %C2 = tsne(C,'Algorithm','Exact','distance','seuclidean','perplexity',5); %Dimension reduction
    D = normat(C);
    n = size(D,1);
    A = 1 : n;
    D = [D';A]';
    D1 = D(1:268,:);
    D2 = D(269:768,:);
    l1 = size(D1,1);
    l2 = size(D2,1);
    D1 = [D1';ones(1,l1)]';                                                    %The lable of 1st class samples
    D2 = [D2';2.*ones(1,l2)]';
    BN = 2;
    Al = [];
    for i = 1 :10
        t01 = randperm(l1);
        t02 = randperm(l2);
                DD1 = D1;
        DD2 = D2;
        if i <= 2
            Te1 = DD1(t01((i-1)*26+1:i*26),:);
            DD1(t01((i-1)*26+1:i*26),:) = [];
        end
        if i > 2 && i < 10
            Te1 = DD1(t01(52+(i-3)*27+1:52+(i-2)*27),:);
            DD1(t01(52+(i-3)*27+1:52+(i-2)*27),:) = [];
        end
        if i == 10
            Te1 = DD1(t01(242:end),:);
            DD1(t01(242:end),:) = [];
        end
        Te2 = DD2(t02((i-1)*50+1:i*50),:);
        DD2(t02((i-1)*50+1:i*50),:) = [];
        Tr1 = DD1;
        Tr2 = DD2;
        TrainData = [Tr1;Tr2];
        TestData = [Te1;Te2];
        %}
        
        %3--Haberman
        %{
    load Haberman.mat
    C = [one;two];
    %C2 = tsne(C,'distance','jaccard','perplexity',20);
    D = normat(C2);
    n = size(D,1);
    A = 1 : n;
    D = [D';A]';
    D1 = D(1:225,:);
    D2 = D(226:306,:);
    l1 = size(D1,1);
    l2 = size(D2,1);
    D1 = [D1';ones(1,l1)]';                                                    %The lable of 1st class samples
    D2 = [D2';2.*ones(1,l2)]';                                                 %The lable of 2ed class samples
    BN = 2;
    Al = [];
    for i = 1 :10
        t01 = randperm(l1);
        t02 = randperm(l2);
        DD1 = D1;
        DD2 = D2;
        if i <= 5
            Te1 = DD1(t01((i-1)*22+1:i*22),:);
            DD1(t01((i-1)*22+1:i*22),:) = [];
        end
        if i > 5 && i < 10
            Te1 = DD1(t01(110+(i-6)*23+1:110+(i-5)*23),:);
            DD1(t01(110+(i-6)*23+1:110+(i-5)*23),:) = [];
        end
        if i == 10
            Te1 = DD1(t01(203:end),:);
            DD1(t01(203:end),:) = [];
        end
        if i < 10
            Te2 = DD2(t02((i-1)*8+1:i*8),:);
            DD2(t02((i-1)*8+1:i*8),:) = [];
        else
            Te2 = DD2(t02(73:end),:);
            DD2(t02(73:end),:) = [];
        end
        Tr1 = DD1;
        Tr2 = DD2;
        TrainData = [Tr1;Tr2];
        TestData = [Te1;Te2];
        %}
        
        %4--Heart-statlog
        %{
    load Heart-statlog.mat
    C = [One;Two];
    C2 = tsne(C,'distance','seuclidean','perplexity',50);
    D = normat(C2);
    n = size(D,1);
    A = 1 : n;
    D = [D';A]';
    D1 = D(1:150,:);
    D2 = D(151:end,:);
    l1 = size(D1,1);
    l2 = size(D2,1);
    D1 = [D1';ones(1,l1)]';
    D2 = [D2';2.*ones(1,l2)]';
    BN = 2;
    Al = [];
    for i = 1 :10
        t01 = randperm(l1);
        t02 = randperm(l2);
        DD1 = D1;
        DD2 = D2;
        Te1 = DD1(t01((i-1)*15+1:i*15),:);
        Te2 = DD2(t02((i-1)*12+1:i*12),:);
        DD1(t01((i-1)*15+1:i*15),:) = [];
        DD2(t02((i-1)*12+1:i*12),:) = [];
        Tr1 = DD1;
        Tr2 = DD2;
        TrainData = [Tr1;Tr2];
        TestData = [Te1;Te2];
        %}
      
        %5--Ionosphere
        %{
    load Ionosphere.mat
    C = [B;G];
    C2 = tsne(C,'Algorithm','Exact','distance','spearman','perplexity',5);
    D = normat(C2);
    n = size(D,1);
    A = 1 : n;
    D = [D';A]';
    D1 = D(1:126,:);
    D2 = D(127:end,:);
    l1 = size(D1,1);
    l2 = size(D2,1);
    D1 = [D1';ones(1,l1)]';
    D2 = [D2';2.*ones(1,l2)]';
    BN = 2;
    Al = [];
    for i = 1 :10
        t01 = randperm(l1);
        t02 = randperm(l2);
        DD1 = D1;
        DD2 = D2;
        if i <= 6
            Te1 = DD1(t01((i-1)*13+1:i*13),:);
            DD1(t01((i-1)*13+1:i*13),:) = [];
        end
        if i > 6 && i < 10
            Te1 = DD1(t01(78+(i-7)*12+1:78+(i-6)*12),:);
            DD1(t01(78+(i-7)*12+1:78+(i-6)*12),:) = [];
        end
        if i == 10
            Te1 = DD1(t01(115:end),:);
            DD1(t01(115:end),:) = [];
        end
        if i <= 5
            Te2 = DD2(t02((i-1)*23+1:i*23),:);
            DD2(t02((i-1)*23+1:i*23),:) = [];
        end
        if i > 5 && i < 10
            Te2 = DD2(t02(115+(i-6)*22+1:115+(i-5)*22),:);
            DD2(t02(115+(i-6)*22+1:115+(i-5)*22),:) = [];
        end
        if i == 10
            Te2 = DD2(t02(204:end),:);
            DD2(t02(204:end),:) = [];
        end
        Tr1 = DD1;
        Tr2 = DD2;
        TrainData = [Tr1;Tr2];
        TestData = [Te1;Te2];
        %}
        
        %6--iris
        %{
    load iris.mat
    C = [Se;Ve;Vi];
    C2 = tsne(C);
    D = normat(C2);
    n = size(D,1);
    A = 1 : n;
    D = [D';A]';
    D1 = D(1:50,:);
    D2 = D(51:100,:);
    D3 = D(101:150,:);
    l1 = size(D1,1);
    l2 = size(D2,1);
    l3 = size(D3,1);
    D1 = [D1';ones(1,l1)]';                                                    %The lable of 1st class samples
    D2 = [D2';2.*ones(1,l2)]';                                                 %The lable of 2ed class samples
    D3 = [D3';3.*ones(1,l3)]';
    BN = 3;
    Al = [];
    for i = 1 :10
        t01 = randperm(l1);
        t02 = randperm(l2);
        t03 = randperm(l3);
        DD1 = D1;
        DD2 = D2;
        DD3 = D3;
        Te1 = DD1(t01((i-1)*5+1:i*5),:);
        Te2 = DD2(t02((i-1)*5+1:i*5),:);
        Te3 = DD3(t03((i-1)*5+1:i*5),:);
        DD1(t01((i-1)*5+1:i*5),:) = [];
        DD2(t02((i-1)*5+1:i*5),:) = [];
        DD3(t03((i-1)*5+1:i*5),:) = [];
        Tr1 = DD1;
        Tr2 = DD2;
        Tr3 = DD3;
        TrainData = [Tr1;Tr2;Tr3];
        TestData = [Te1;Te2;Te3];
        %}
       
        %7--kr-vs-kp
        %{
    load kr-vs-kp.mat
    C = [win;nowin];
    C2 = tsne(C,'Algorithm','Exact','distance','jaccard','perplexity',30);
    D = normat(C2);
    n = size(D,1);
    A = 1 : n;
    D = [D';A]';
    D1 = D(1:1669,:);
    D2 = D(1670:end,:);
    l1 = size(D1,1);
    l2 = size(D2,1);
    D1 = [D1';ones(1,l1)]';
    D2 = [D2';2.*ones(1,l2)]';
    BN = 2;
    Al = [];
    for i = 1 :10
        t01 = randperm(l1);
        t02 = randperm(l2);
        DD1 = D1;
        DD2 = D2;
        if i < 10
            Te1 = DD1(t01((i-1)*167+1:i*167),:);
            DD1(t01((i-1)*167+1:i*167),:) = [];
        else
            Te1 = DD1(t01(1504:end),:);
            DD1(t01(1504:end),:) = [];
        end
        if i <= 3
            Te2 = DD2(t02((i-1)*152+1:i*152),:);
            DD2(t02((i-1)*152+1:i*152),:) = [];
        end
        if i > 3 && i < 10
            Te2 = DD2(t02(456+(i-4)*153+1:456+(i-3)*153),:);
            DD2(t02(456+(i-4)*153+1:456+(i-3)*153),:) = [];
        end
        if i == 10
            Te2 = DD2(t02(1375:end),:);
            DD2(t02(1375:end),:) = [];
        end
        Tr1 = DD1;
        Tr2 = DD2;
        TrainData = [Tr1;Tr2];
        TestData = [Te1;Te2];
        %}
       
        %8--Letter
        %{
    load Letter.mat
    C = [A;B;C;D;E;F;G;H;I;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z];
    C2 = tsne(C);
    D = normat(C2);
	n = size(D,1);
    A = 1 : n;
    D = [D';A]';
    D1 = D(1:789,:);
    D2 = D(790:1555,:);
    D3 = D(1556:2291,:);
    D4 = D(2292:3096,:);
    D5 = D(3097:3864,:);
    D6 = D(3865:4639,:);
    D7 = D(4640:5412,:);
    D8 = D(5413:6146,:);
    D9 = D(6147:6901,:);
    D10 = D(6902:7648,:);
    D11 = D(7649:8387,:);
    D12 = D(8388:9148,:);
    D13 = D(9149:9940,:);
    D14 = D(9941:10723,:);
    D15 = D(10724:11476,:);
    D16 = D(11477:12279,:);
    D17 = D(12280:13062,:);
    D18 = D(13063:13820,:);
    D19 = D(13821:14568,:);
    D20 = D(14569:15364,:);
    D21 = D(15365:16177,:);
    D22 = D(16178:16941,:);
    D23 = D(16942:17693,:);
    D24 = D(17694:18480,:);
    D25 = D(18481:19266,:);
    D26 = D(19267:end,:);
    l1 = size(D1,1);
    l2 = size(D2,1);
    l3 = size(D3,1);
    l4 = size(D4,1);
    l5 = size(D5,1);
    l6 = size(D6,1);
    l7 = size(D7,1);
    l8 = size(D8,1);
    l9 = size(D9,1);
    l10 = size(D10,1);
    l11 = size(D11,1);
    l12 = size(D12,1);
    l13 = size(D13,1);
    l14 = size(D14,1);
    l15 = size(D15,1);
    l16 = size(D16,1);
    l17 = size(D17,1);
    l18 = size(D18,1);
    l19 = size(D19,1);
    l20 = size(D20,1);
    l21 = size(D21,1);
    l22 = size(D22,1);
    l23 = size(D23,1);
    l24 = size(D24,1);
    l25 = size(D25,1);
    l26 = size(D26,1);
    D1 = [D1';ones(1,l1)]';
    D2 = [D2';2.*ones(1,l2)]';
    D3 = [D3';3.*ones(1,l3)]';
    D4 = [D4';4.*ones(1,l4)]';
    D5 = [D5';5.*ones(1,l5)]';
    D6 = [D6';6.*ones(1,l6)]';
    D7 = [D7';7.*ones(1,l7)]';
    D8 = [D8';8.*ones(1,l8)]';
    D9 = [D9';9.*ones(1,l9)]';
    D10 = [D10';10.*ones(1,l10)]';
    D11 = [D11';11.*ones(1,l11)]';
    D12 = [D12';12.*ones(1,l12)]';
    D13 = [D13';13.*ones(1,l13)]';
    D14 = [D14';14.*ones(1,l14)]';
    D15 = [D15';15.*ones(1,l15)]';
    D16 = [D16';16.*ones(1,l16)]';
    D17 = [D17';17.*ones(1,l17)]';
    D18 = [D18';18.*ones(1,l18)]';
    D19 = [D19';19.*ones(1,l19)]';
    D20 = [D20';20.*ones(1,l20)]';
    D21 = [D21';21.*ones(1,l21)]';
    D22 = [D22';22.*ones(1,l22)]';
    D23 = [D23';23.*ones(1,l23)]';
    D24 = [D24';24.*ones(1,l24)]';
    D25 = [D25';25.*ones(1,l25)]';
    D26 = [D26';26.*ones(1,l26)]';
    BN = 26;
    Al = [];
    for i = 1 :10
        t01 = randperm(l1);
        t02 = randperm(l2);
        t03 = randperm(l3);
        t04 = randperm(l4);
        t05 = randperm(l5);
        t06 = randperm(l6);
        t07 = randperm(l7);
        t08 = randperm(l8);
        t09 = randperm(l9);
        t10 = randperm(l10);
        t11 = randperm(l11);
        t12 = randperm(l12);
        t13 = randperm(l13);
        t14 = randperm(l14);
        t15 = randperm(l15);
        t16 = randperm(l16);
        t17 = randperm(l17);
        t18 = randperm(l18);
        t19 = randperm(l19);
        t20 = randperm(l20);
        t21 = randperm(l21);
        t22 = randperm(l22);
        t23 = randperm(l23);
        t24 = randperm(l24);
        t25 = randperm(l25);
        t26 = randperm(l26);
        DD01 = D1;
        DD02 = D2;
        DD03 = D3;
        DD04 = D4;
        DD05 = D5;
        DD06 = D6;
        DD07 = D7;
        DD08 = D8;
        DD09 = D9;
        DD10 = D10;
        DD11 = D11;
        DD12 = D12;
        DD13 = D13;
        DD14 = D14;
        DD15 = D15;
        DD16 = D16;
        DD17 = D17;
        DD18 = D18;
        DD19 = D19;
        DD20 = D20;
        DD21 = D21;
        DD22 = D22;
        DD23 = D23;
        DD24 = D24;
        DD25 = D25;
        DD26 = D26;
        %1A
        if i < 10
            Te01 = DD01(t01((i-1)*79+1:i*79),:);
            DD01(t01((i-1)*79+1:i*79),:) = [];
        else
            Te01 = DD01(t01(712:end),:);
            DD01(t01(712:end),:) = [];
        end
        %2B
        if i <= 6
            Te02 = DD02(t02((i-1)*77+1:i*77),:);
            DD02(t02((i-1)*77+1:i*77),:) = [];
        end
        if i > 6 && i < 10
            Te02 = DD02(t02(462+(i-7)*76+1:462+(i-6)*76),:);
            DD02(t02(462+(i-7)*76+1:462+(i-6)*76),:) = [];
        end
        if i == 10
            Te02 = DD02(t02(691:end),:);
            DD02(t02(691:end),:) = [];
        end
        %3C
        if i <= 6
            Te03 = DD03(t03((i-1)*74+1:i*74),:);
            DD03(t03((i-1)*74+1:i*74),:) = [];
        end
        if i > 6 && i < 10
            Te03 = DD03(t03(444+(i-7)*73+1:444+(i-6)*73),:);
            DD03(t03(444+(i-7)*73+1:444+(i-6)*73),:) = [];
        end
        if i == 10
            Te03 = DD03(t03(664:end),:);
            DD03(t03(664:end),:) = [];
        end
        %4D
        if i <= 5
            Te04 = DD04(t04((i-1)*81+1:i*81),:);
            DD04(t04((i-1)*81+1:i*81),:) = [];
        end
        if i > 5 && i < 10
            Te04 = DD04(t04(405+(i-6)*80+1:405+(i-5)*80),:);
            DD04(t04(405+(i-6)*80+1:405+(i-5)*80),:) = [];
        end
        if i == 10
            Te04 = DD04(t04(726:end),:);
            DD04(t04(726:end),:) = [];
        end
        %5E
        if i <= 8
            Te05 = DD05(t05((i-1)*77+1:i*77),:);
            DD05(t05((i-1)*77+1:i*77),:) = [];
        end
        if i > 8 && i < 10
            Te05 = DD05(t05(616+(i-9)*76+1:616+(i-8)*76),:);
            DD05(t05(616+(i-9)*76+1:616+(i-8)*76),:) = [];
        end
        if i == 10
            Te05 = DD05(t05(693:end),:);
            DD05(t05(693:end),:) = [];
        end
        %6F
        if i <= 5
            Te06 = DD06(t06((i-1)*78+1:i*78),:);
            DD06(t06((i-1)*78+1:i*78),:) = [];
        end
        if i > 5 && i < 10
            Te06 = DD06(t06(390+(i-6)*77+1:390+(i-5)*77),:);
            DD06(t06(390+(i-6)*77+1:390+(i-5)*77),:) = [];
        end
        if i == 10
            Te06 = DD06(t06(699:end),:);
            DD06(t06(699:end),:) = [];
        end
        %7G
        if i <= 3
            Te07 = DD07(t07((i-1)*78+1:i*78),:);
            DD07(t07((i-1)*78+1:i*78),:) = [];
        end
        if i > 3 && i < 10
            Te07 = DD07(t07(234+(i-4)*77+1:234+(i-3)*77),:);
            DD07(t07(234+(i-4)*77+1:234+(i-3)*77),:) = [];
        end
        if i == 10
            Te07 = DD07(t07(697:end),:);
            DD07(t07(697:end),:) = [];
        end
        %8H
        if i <= 4
            Te08 = DD08(t08((i-1)*74+1:i*74),:);
            DD08(t08((i-1)*74+1:i*74),:) = [];
        end
        if i > 4 && i < 10
            Te08 = DD08(t08(296+(i-5)*73+1:296+(i-4)*73),:);
            DD08(t08(296+(i-5)*73+1:296+(i-4)*73),:) = [];
        end
        if i == 10
            Te08 = DD08(t08(662:end),:);
            DD08(t08(662:end),:) = [];
        end
        %9I
        if i <= 5
            Te09 = DD09(t09((i-1)*76+1:i*76),:);
            DD09(t09((i-1)*76+1:i*76),:) = [];
        end
        if i > 5 && i < 10
            Te09 = DD09(t09(380+(i-6)*75+1:380+(i-5)*75),:);
            DD09(t09(380+(i-6)*75+1:380+(i-5)*75),:) = [];
        end
        if i == 10
            Te09 = DD09(t09(681:end),:);
            DD09(t09(681:end),:) = [];
        end
        %10J
        if i <= 7
            Te10 = DD10(t10((i-1)*75+1:i*75),:);
            DD10(t10((i-1)*75+1:i*75),:) = [];
        end
        if i > 7 && i < 10
            Te10 = DD10(t10(525+(i-8)*74+1:525+(i-7)*74),:);
            DD10(t10(525+(i-8)*74+1:525+(i-7)*74),:) = [];
        end
        if i == 10
            Te10 = DD10(t10(674:end),:);
            DD10(t10(674:end),:) = [];
        end
        %11K
        if i < 10
            Te11 = DD11(t11((i-1)*74+1:i*74),:);
            DD11(t11((i-1)*74+1:i*74),:) = [];
        else
            Te11 = DD11(t11(667:end),:);
            DD11(t11(667:end),:) = [];
        end
        %12L
        if i < 10
            Te12 = DD12(t12((i-1)*76+1:i*76),:);
            DD12(t12((i-1)*76+1:i*76),:) = [];
        else
            Te12 = DD12(t12(685:end),:);
            DD12(t12(685:end),:) = [];
        end
        %13M
        if i <= 2
            Te13 = DD13(t13((i-1)*80+1:i*80),:);
            DD13(t13((i-1)*80+1:i*80),:) = [];
        end
        if i > 2 && i < 10
            Te13 = DD13(t13(160+(i-3)*79+1:160+(i-2)*79),:);
            DD13(t13(160+(i-3)*79+1:160+(i-2)*79),:) = [];
        end
        if i == 10
            Te13 = DD13(t13(714:end),:);
            DD13(t13(714:end),:) = [];
        end
        %14N
        if i <= 3
            Te14 = DD14(t14((i-1)*79+1:i*79),:);
            DD14(t14((i-1)*79+1:i*79),:) = [];
        end
        if i > 3 && i < 10
            Te14 = DD14(t14(237+(i-4)*78+1:237+(i-3)*78),:);
            DD14(t14(237+(i-4)*78+1:237+(i-3)*78),:) = [];
        end
        if i == 10
            Te14 = DD14(t14(706:end),:);
            DD14(t14(706:end),:) = [];
        end
        %15O
        if i <= 3
            Te15 = DD15(t15((i-1)*76+1:i*76),:);
            DD15(t15((i-1)*76+1:i*76),:) = [];
        end
        if i > 3 && i < 10
            Te15 = DD15(t15(228+(i-4)*75+1:228+(i-3)*75),:);
            DD15(t15(228+(i-4)*75+1:228+(i-3)*75),:) = [];
        end
        if i == 10
            Te15 = DD15(t15(679:end),:);
            DD15(t15(679:end),:) = [];
        end
        %16P
        if i <= 3
            Te16 = DD16(t16((i-1)*81+1:i*81),:);
            DD16(t16((i-1)*81+1:i*81),:) = [];
        end
        if i > 3 && i < 10
            Te16 = DD16(t16(243+(i-4)*80+1:243+(i-3)*80),:);
            DD16(t16(243+(i-4)*80+1:243+(i-3)*80),:) = [];
        end
        if i == 10
            Te16 = DD16(t16(724:end),:);
            DD16(t16(724:end),:) = [];
        end
        %17Q
        if i <= 3
            Te17 = DD17(t17((i-1)*79+1:i*79),:);
            DD17(t17((i-1)*79+1:i*79),:) = [];
        end
        if i > 3 && i < 10
            Te17 = DD17(t17(237+(i-4)*78+1:237+(i-3)*78),:);
            DD17(t17(237+(i-4)*78+1:237+(i-3)*78),:) = [];
        end
        if i == 10
            Te17 = DD17(t17(706:end),:);
            DD17(t17(706:end),:) = [];
        end
        %18R
        if i <= 8
            Te18 = DD18(t18((i-1)*76+1:i*76),:);
            DD18(t18((i-1)*76+1:i*76),:) = [];
        end
        if i > 8 && i < 10
            Te18 = DD18(t18(608+(i-9)*75+1:608+(i-8)*75),:);
            DD18(t18(608+(i-9)*75+1:608+(i-8)*75),:) = [];
        end
        if i == 10
            Te18 = DD18(t18(684:end),:);
            DD18(t18(684:end),:) = [];
        end
        %19S
        if i <= 8
            Te19 = DD19(t19((i-1)*75+1:i*75),:);
            DD19(t19((i-1)*75+1:i*75),:) = [];
        end
        if i > 8 && i < 10
            Te19 = DD19(t19(600+(i-9)*74+1:600+(i-8)*74),:);
            DD19(t19(600+(i-9)*74+1:600+(i-8)*74),:) = [];
        end
        if i == 10
            Te19 = DD19(t19(675:end),:);
            DD19(t19(675:end),:) = [];
        end
        %20T
        if i <= 6
            Te20 = DD20(t20((i-1)*80+1:i*80),:);
            DD20(t20((i-1)*80+1:i*80),:) = [];
        end
        if i > 6 && i < 10
            Te20 = DD20(t20(480+(i-7)*79+1:480+(i-6)*79),:);
            DD20(t20(480+(i-7)*79+1:480+(i-6)*79),:) = [];
        end
        if i == 10
            Te20 = DD20(t20(718:end),:);
            DD20(t20(718:end),:) = [];
        end
        %21U
        if i <= 3
            Te21 = DD21(t21((i-1)*82+1:i*82),:);
            DD21(t21((i-1)*82+1:i*82),:) = [];
        end
        if i > 3 && i < 10
            Te21 = DD21(t21(246+(i-4)*81+1:246+(i-3)*81),:);
            DD21(t21(246+(i-4)*81+1:246+(i-3)*81),:) = [];
        end
        if i == 10
            Te21 = DD21(t21(733:end),:);
            DD21(t21(733:end),:) = [];
        end
        %22V
        if i <= 4
            Te22 = DD22(t22((i-1)*77+1:i*77),:);
            DD22(t22((i-1)*77+1:i*77),:) = [];
        end
        if i > 4 && i < 10
            Te22 = DD22(t22(308+(i-5)*76+1:308+(i-4)*76),:);
            DD22(t22(308+(i-5)*76+1:308+(i-4)*76),:) = [];
        end
        if i == 10
            Te22 = DD22(t22(689:end),:);
            DD22(t22(689:end),:) = [];
        end
        %23W
        if i <= 2
            Te23 = DD23(t23((i-1)*76+1:i*76),:);
            DD23(t23((i-1)*76+1:i*76),:) = [];
        end
        if i > 2 && i < 10
            Te23 = DD23(t23(152+(i-3)*75+1:152+(i-2)*75),:);
            DD23(t23(152+(i-3)*75+1:152+(i-2)*75),:) = [];
        end
        if i == 10
            Te23 = DD23(t23(678:end),:);
            DD23(t23(678:end),:) = [];
        end
        %24X
        if i <= 7
            Te24 = DD24(t24((i-1)*79+1:i*79),:);
            DD24(t24((i-1)*79+1:i*79),:) = [];
        end
        if i > 7 && i < 10
            Te24 = DD24(t24(553+(i-8)*78+1:553+(i-7)*78),:);
            DD24(t24(553+(i-8)*78+1:553+(i-7)*78),:) = [];
        end
        if i == 10
            Te24 = DD24(t24(710:end),:);
            DD24(t24(710:end),:) = [];
        end
        %25Y
        if i <= 6
            Te25 = DD25(t25((i-1)*79+1:i*79),:);
            DD25(t25((i-1)*79+1:i*79),:) = [];
        end
        if i > 6 && i < 10
            Te25 = DD25(t25(474+(i-7)*78+1:474+(i-6)*78),:);
            DD25(t25(474+(i-7)*78+1:474+(i-6)*78),:) = [];
        end
        if i == 10
            Te25 = DD25(t25(709:end),:);
            DD25(t25(709:end),:) = [];
        end
        %26Z
        if i <= 4
            Te26 = DD26(t26((i-1)*74+1:i*74),:);
            DD26(t26((i-1)*74+1:i*74),:) = [];
        end
        if i > 4 && i < 10
            Te26 = DD26(t26(296+(i-5)*73+1:296+(i-4)*73),:);
            DD26(t26(296+(i-5)*73+1:296+(i-4)*73),:) = [];
        end
        if i == 10
            Te26 = DD26(t26(662:end),:);
            DD26(t26(662:end),:) = [];
        end
        Tr01 = DD01;
        Tr02 = DD02;
        Tr03 = DD03;
        Tr04 = DD04;
        Tr05 = DD05;
        Tr06 = DD06;
        Tr07 = DD07;
        Tr08 = DD08;
        Tr09 = DD09;
        Tr10 = DD10;
        Tr11 = DD11;
        Tr12 = DD12;
        Tr13 = DD13;
        Tr14 = DD14;
        Tr15 = DD15;
        Tr16 = DD16;
        Tr17 = DD17;
        Tr18 = DD18;
        Tr19 = DD19;
        Tr20 = DD20;
        Tr21 = DD21;
        Tr22 = DD22;
        Tr23 = DD23;
        Tr24 = DD24;
        Tr25 = DD25;
        Tr26 = DD26;
        TrainData = [Tr01;Tr02;Tr03;Tr04;Tr05;Tr06;Tr07;Tr08;Tr09;Tr10;Tr11;Tr12;Tr13;Tr14;Tr15;Tr16;Tr17;Tr18;Tr19;Tr20;Tr21;Tr22;Tr23;Tr24;Tr25;Tr26];
        TestData =  [Te01;Te02;Te03;Te04;Te05;Te06;Te07;Te08;Te09;Te10;Te11;Te12;Te13;Te14;Te15;Te16;Te17;Te18;Te19;Te20;Te21;Te22;Te23;Te24;Te25;Te26];
        %}
        
        %9--Lymphography
        %{
    load Lymphography.mat
    C = [A;B;C;D];
    C2 = tsne(C,'Algorithm','Exact','distance','seuclidean','perplexity',40);
    D = normat(C2);
    n = size(D,1);
    A = 1 : n;
    D = [D';A]';
    D1 = D(1:2,:);
    D2 = D(3:83,:);
    D3 = D(84:144,:);
    D4 = D(145:end,:);
    l1 = size(D1,1);
    l2 = size(D2,1);
    l3 = size(D3,1);
    l4 = size(D4,1);
    D1 = [D1';ones(1,l1)]';                                                    %The lable of 1st class samples
    D2 = [D2';2.*ones(1,l2)]';                                                 %The lable of 2ed class samples
    D3 = [D3';3.*ones(1,l3)]';
    D4 = [D4';4.*ones(1,l4)]';
    BN = 4;
    Al = [];
    for i = 1 :10
        t01 = randperm(l1);
        t02 = randperm(l2);
        t03 = randperm(l3);
        t04 = randperm(l4);
        DD01 = D1;
        DD02 = D2;
        DD03 = D3;
        DD04 = D4;
        if i < 3
            Te01 = DD01(t01((i-1)*1+1:i*1),:);
            DD01(t01((i-1)*1+1:i*1),:) = [];
        else
            Te01 = [];
        end
        if i < 10
            Te02 = DD02(t02((i-1)*8+1:i*8),:);
            DD02(t02((i-1)*8+1:i*8),:) = [];
        else
            Te02 = DD02(t02(73:end),:);
            DD02(t02(73:end),:) = [];
        end
        if i < 10
            Te03 = DD03(t03((i-1)*6+1:i*6),:);
            DD03(t03((i-1)*6+1:i*6),:) = [];
        else
            Te03 = DD03(t03(55:end),:);
            DD03(t03(55:end),:) = [];
        end
        if i > 5 && i < 10
            Te04 = DD04(t04((i-6)*1+1:(i-5)*1),:);
            DD04(t04((i-6)*1+1:(i-5)*1),:) = [];
        else
            Te04 = [];
        end
        Tr01 = DD01;
        Tr02 = DD02;
        Tr03 = DD03;
        Tr04 = DD04;
        TrainData = [Tr01;Tr02;Tr03;Tr04];
        TestData =  [Te01;Te02;Te03;Te04];
        %}
        
        %10--monk1
        %{
    load monk1.mat
    C = [Tr1;Tr2];
    C2 = tsne(C,'Algorithm','Exact','distance','spearman','perplexity',50);
    D = normat(C2);
    n = size(D,1);
    A = 1 : n;
    D = [D';A]';
    D1 = D(1:62,:);
    D2 = D(63:124,:);
    l1 = size(D1,1);
    l2 = size(D2,1);
    D1 = [D1';ones(1,l1)]';
    D2 = [D2';2.*ones(1,l2)]';
    l1 = size(D1,1);
    l2 = size(D2,1);
    BN = 2;
    Al = [];
    for i = 1 :10
        t01 = randperm(l1);
        t02 = randperm(l2);
        DD1 = D1;
        DD2 = D2;
        if i <= 8
            Te1 = DD1(t01((i-1)*6+1:i*6),:);
            DD1(t01((i-1)*6+1:i*6),:) = [];
            Te2 = DD2(t02((i-1)*6+1:i*6),:);
            DD2(t02((i-1)*6+1:i*6),:) = [];
        end
        if i > 9 && i < 10
            Te1 = DD1(t01(48+(i-9)*7+1:48+(i-8)*7),:);
            DD1(t01(48+(i-9)*7+1:48+(i-8)*7),:) = [];
            Te2 = DD2(t02(48+(i-9)*7+1:48+(i-8)*7),:);
            DD2(t02(48+(i-9)*7+1:48+(i-8)*7),:) = [];
        end
        if i == 10
            Te1 = DD1(t01(56:end),:);
            DD1(t01(56:end),:) = [];
            Te2 = DD2(t02(56:end),:);
            DD2(t02(56:end),:) = [];
        end
        Tr1 = DD1;
        Tr2 = DD2;
        TrainData = [Tr1;Tr2];
        TestData = [Te1;Te2];
        %}
        
        %11--monk2
        %{
    load monk2.mat
    C = [Tr1;Tr2];
    C2 = tsne(C,'Algorithm','Exact','distance','mahalanobis' ,'perplexity',50);
    D = normat(C2);
    n = size(D,1);
    A = 1 : n;
    D = [D';A]';
    D1 = D(1:105,:);
    D2 = D(106:169,:);
    l01 = size(D1,1);
    l02 = size(D2,1);
    D1 = [D1';ones(1,l01)]';
    D2 = [D2';2.*ones(1,l02)]';
    l1 = size(D1,1);
    l2 = size(D2,1);
    BN = 2;
    Al = [];
    for i = 1 :10
        t01 = randperm(l1);
        t02 = randperm(l2);
        DD1 = D1;
        DD2 = D2;
        if i <= 5
            Te1 = DD1(t01((i-1)*10+1:i*10),:);
            DD1(t01((i-1)*10+1:i*10),:) = [];
        end
        if i > 6 && i < 10
            Te1 = DD1(t01(50+(i-6)*11+1:50+(i-5)*11),:);
            DD1(t01(50+(i-6)*11+1:50+(i-5)*11),:) = [];
        end
        if i == 10
            Te1 = DD1(t01(95:end),:);
            DD1(t01(95:end),:) = [];
        end
        if i <= 6
            Te2 = DD2(t02((i-1)*6+1:i*6),:);
            DD2(t02((i-1)*6+1:i*6),:) = [];
        end
        if i > 7 && i < 10
            Te2 = DD2(t02(36+(i-7)*7+1:36+(i-6)*7),:);
            DD2(t02(36+(i-7)*7+1:36+(i-6)*7),:) = [];
        end
        if i == 10
            Te2 = DD2(t02(58:end),:);
            DD2(t02(58:end),:) = [];
        end
        Tr1 = DD1;
        Tr2 = DD2;
        TrainData = [Tr1;Tr2];
        TestData = [Te1;Te2];
        %}
        
        %12--monk3
        %{
    load monk3.mat
    C = [Tr1;Tr2];
    C2 = tsne(C,'perplexity',20);
    D = normat(C2);
    n = size(D,1);
    A = 1 : n;
    D = [D';A]';
    D1 = D(1:62,:);
    D2 = D(63:122,:);
    l01 = size(D1,1);
    l02 = size(D2,1);
    D1 = [D1';ones(1,l01)]';
    D2 = [D2';2.*ones(1,l02)]';
    l1 = size(D1,1);
    l2 = size(D2,1);
    BN = 2;
    Al = [];
    for i = 1 :10
        t01 = randperm(l1);
        t02 = randperm(l2);
        DD1 = D1;
        DD2 = D2;
        if i <= 8
            Te1 = DD1(t01((i-1)*6+1:i*6),:);
            DD1(t01((i-1)*6+1:i*6),:) = [];
        end
        if i > 9 && i < 10
            Te1 = DD1(t01(48+(i-9)*7+1:48+(i-8)*7),:);
            DD1(t01(48+(i-9)*7+1:48+(i-8)*7),:) = [];
        end
        if i == 10
            Te1 = DD1(t01(56:end),:);
            DD1(t01(56:end),:) = [];
        end
        Te2 = DD2(t02((i-1)*6+1:i*6),:);
        DD2(t02((i-1)*6+1:i*6),:) = [];
        Tr1 = DD1;
        Tr2 = DD2;
        TrainData = [Tr1;Tr2];
        TestData = [Te1;Te2];
        %}
        
        %13--nursery
        %{
    load nursery.mat
    C = [NR;P;R;SP;VR];
    C2 = tsne(C,'distance','mahalanobis' ,'perplexity',50);
    D = normat(C2);
    n = size(D,1);
    A = 1 : n;
    D = [D';A]';
    D1 = D(1:4320,:);
    D2 = D(4321:8586,:);
    D3 = D(8587:8588,:);
    D4 = D(8589:12632,:);
    D5 = D(12633:end,:);
    l1 = size(D1,1);
    l2 = size(D2,1);
    l3 = size(D3,1);
    l4 = size(D4,1);
    l5 = size(D5,1);
    D1 = [D1';ones(1,l1)]';                                                    %The lable of 1st class samples
    D2 = [D2';2.*ones(1,l2)]';                                                 %The lable of 2ed class samples
    D3 = [D3';3.*ones(1,l3)]';
    D4 = [D4';4.*ones(1,l4)]';
    D5 = [D5';5.*ones(1,l5)]';
    BN = 5;
    Al = [];
    for i = 1 :10
        t01 = randperm(l1);
        t02 = randperm(l2);
        t03 = randperm(l3);
        t04 = randperm(l4);
        t05 = randperm(l5);
        DD01 = D1;
        DD02 = D2;
        DD03 = D3;
        DD04 = D4;
        DD05 = D5;
        Te1 = DD01(t01((i-1)*432+1:i*432),:);
        DD01(t01((i-1)*432+1:i*432),:) = [];
        if i <= 4
            Te2 = DD02(t02((i-1)*426+1:i*426),:);
            DD02(t02((i-1)*426+1:i*426),:) = [];
            Te4 = DD04(t04((i-1)*405+1:i*405),:);
            DD04(t04((i-1)*405+1:i*405),:) = [];
        end
        if i > 4 && i < 10
            Te2 = DD02(t02(1705+(i-5)*427+1:1705+(i-4)*427),:);
            DD02(t02(1705+(i-5)*427+1:1705+(i-4)*427),:) = [];
            Te4 = DD04(t04(1621+(i-5)*404+1:1621+(i-4)*404),:);
            DD04(t04(1621+(i-5)*404+1:1621+(i-4)*404),:) = [];
        end
        if i == 10
            Te2 = DD02(t02(3840:end),:);
            DD02(t02(3840:end),:) = [];
            Te4 = DD04(t04(3641:end),:);
            DD04(t04(3641:end),:) = [];
        end
        if i < 3
            Te3 = DD03(t03((i-1)*1+1:i*1),:);
            DD03(t03((i-1)*1+1:i*1),:) = [];
        else
            Te3 = [];
        end
        if i <= 2
            Te5 = DD05(t05((i-1)*32+1:i*32),:);
            DD05(t05((i-1)*32+1:i*32),:) = [];
        end
        if i > 2 && i < 10
            Te5 = DD05(t05(65+(i-3)*33+1:65+(i-2)*33),:);
            DD05(t05(65+(i-3)*33+1:65+(i-2)*33),:) = [];
        end
        if i == 10
            Te5 = DD05(t05(296:end),:);
            DD05(t05(296:end),:) = [];
        end
        Tr1 = DD01;
        Tr2 = DD02;
        Tr3 = DD03;
        Tr4 = DD04;
        Tr5 = DD05;
        TrainData = [Tr1;Tr2;Tr3;Tr4;Tr5];
        TestData = [Te1;Te2;Te3;Te4;Te5];
        %}
        
        %14--segment
        %{
    load segment.mat
    C = [Br;Ce;Fo;Gr;Pa;Sk;Wi];
    C2 = tsne(C);
    D = normat(C2);
    n = size(D,1);
    A = 1 : n;
    D = [D';A]';
    D1 = D(1:330,:);
    D2 = D(331:660,:);
    D3 = D(661:990,:);
    D4 = D(991:1320,:);
    D5 = D(1321:1650,:);
    D6 = D(1651:1980,:);
    D7 = D(1981:2310,:);
    l1 = size(D1,1);
    l2 = size(D2,1);
    l3 = size(D3,1);
    l4 = size(D4,1);
    l5 = size(D5,1);
    l6 = size(D6,1);
    l7 = size(D7,1);
    D1 = [D1';ones(1,l1)]';                                                    %The lable of 1st class samples
    D2 = [D2';2.*ones(1,l2)]';                                                 %The lable of 2ed class samples
    D3 = [D3';3.*ones(1,l3)]';                                                 %The lable of 1st class samples
    D4 = [D4';4.*ones(1,l4)]';
    D5 = [D5';5.*ones(1,l5)]';
    D6 = [D6';6.*ones(1,l6)]';
    D7 = [D7';7.*ones(1,l7)]';
    BN = 7;
    Al = [];
    for i = 1 :10
        t01 = randperm(l1);
        t02 = randperm(l2);
        t03 = randperm(l3);
        t04 = randperm(l4);
        t05 = randperm(l5);
        t06 = randperm(l6);
        t07 = randperm(l7);
        DD1 = D1;
        DD2 = D2;
        DD3 = D3;
        DD4 = D4;
        DD5 = D5;
        DD6 = D6;
        DD7 = D7;
        Te1 = DD1(t01((i-1)*33+1:i*33),:);
        Te2 = DD2(t02((i-1)*33+1:i*33),:);
        Te3 = DD3(t03((i-1)*33+1:i*33),:);
        Te4 = DD4(t04((i-1)*33+1:i*33),:);
        Te5 = DD5(t05((i-1)*33+1:i*33),:);
        Te6 = DD6(t06((i-1)*33+1:i*33),:);
        Te7 = DD7(t07((i-1)*33+1:i*33),:);
        DD1(t01((i-1)*33+1:i*33),:) = [];
        DD2(t02((i-1)*33+1:i*33),:) = [];
        DD3(t03((i-1)*33+1:i*33),:) = [];
        DD4(t04((i-1)*33+1:i*33),:) = [];
        DD5(t05((i-1)*33+1:i*33),:) = [];
        DD6(t06((i-1)*33+1:i*33),:) = [];
        DD7(t07((i-1)*33+1:i*33),:) = [];
        Tr1 = DD1;
        Tr2 = DD2;
        Tr3 = DD3;
        Tr4 = DD4;
        Tr5 = DD5;
        Tr6 = DD6;
        Tr7 = DD7;
        TrainData = [Tr1;Tr2;Tr3;Tr4;Tr5;Tr6;Tr7];
        TestData = [Te1;Te2;Te3;Te4;Te5;Te6;Te7];
        %}
        
        %15--Sonar
        %{
    load Sonar.mat
    C = [R;M];
    C2 = tsne(C,'Algorithm','Exact','distance','cosine','NumPCAComponents',20,'perplexity',15);
    D = normat(C2);
    n = size(D,1);
    A = 1 : n;
    D = [D';A]';
    D1 = D(1:97,:);
    D2 = D(98:end,:);
    l1 = size(D1,1);
    l2 = size(D2,1);
    D1 = [D1';ones(1,l1)]';                                                    %The lable of 1st class samples
    D2 = [D2';2.*ones(1,l2)]';                                                 %The lable of 2ed class samples
    BN = 2;
    Al = [];
    for i = 1 :10
        t01 = randperm(l1);
        t02 = randperm(l2);
        DD1 = D1;
        DD2 = D2;
        if i <= 3
            Te1 = DD1(t01((i-1)*9+1:i*9),:);
            DD1(t01((i-1)*9+1:i*9),:) = [];
        end
        if i > 3 && i < 10
            Te1 = DD1(t01(27+(i-4)*10+1:27+(i-3)*10),:);
            DD1(t01(27+(i-4)*10+1:27+(i-3)*10),:) = [];
        end
        if i == 10
            Te1 = DD1(t01(88:end),:);
            DD1(t01(88:end),:) = [];
        end
        if i <= 9
            Te2 = DD2(t02((i-1)*11+1:i*11),:);
            DD2(t02((i-1)*11+1:i*11),:) = [];
        else
            Te2 = DD2(t02(100:end),:);
            DD2(t02(100:end),:) = [];
        end
        Tr1 = DD1;
        Tr2 = DD2;
        TrainData = [Tr1;Tr2];
        TestData = [Te1;Te2];
        %}
        
        %16--Spambase
        %{
    load Spambase.mat
    C = [One;Zero];
    C2 = tsne(C,'perplexity',5,'Options',statset('MaxIter',1500),'Theta',0.1);
    D = normat(C2);
    % [coeff,score,latent] = pca([One;Zero]);
    % D = normat(score);
    n = size(D,1);
    A = 1 : n;
    D = [D';A]';
    D1 = D(1:1813,:);
    D2 = D(1814:end,:);
    l1 = size(D1,1);
    l2 = size(D2,1);
    D1 = [D1';ones(1,l1)]';                                                    %The lable of 1st class samples
    D2 = [D2';2.*ones(1,l2)]';                                                 %The lable of 2ed class samples
    BN = 2;
    Al = [];
    for i = 1 :10
        t01 = randperm(l1);
        t02 = randperm(l2);
        DD1 = D1;
        DD2 = D2;
        if i <= 3
            Te1 = DD1(t01((i-1)*182+1:i*182),:);
            DD1(t01((i-1)*182+1:i*182),:) = [];
        end
        if i > 3 && i < 10
            Te1 = DD1(t01(546+(i-4)*181+1:546+(i-3)*181),:);
            DD1(t01(546+(i-4)*181+1:546+(i-3)*181),:) = [];
        end
        if i == 10
            Te1 = DD1(t01(1633:end),:);
            DD1(t01(1633:end),:) = [];
        end
        if i <= 2
            Te2 = DD2(t02((i-1)*278+1:i*278),:);
            DD2(t02((i-1)*278+1:i*278),:) = [];
        end
        if i > 2 && i < 10
            Te2 = DD2(t02(556+(i-3)*279+1:556+(i-2)*279),:);
            DD2(t02(556+(i-3)*279+1:556+(i-2)*279),:) = [];
        end
        if i == 10
            Te2 = DD2(t02(2510:end),:);
            DD2(t02(2510:end),:) = [];
        end
        Tr1 = DD1;
        Tr2 = DD2;
        TrainData = [Tr1;Tr2];
        TestData = [Te1;Te2];
        %}
        
        %17--Vehicle
        %{
    load Vehicle.mat
    C = [bus;opel;saab;van];
    C2 = tsne(C,'Algorithm','Exact','distance','hamming','perplexity',20);
    D = normat(C2);
    n = size(D,1);
    A = 1 : n;
    D = [D';A]';
    D1 = D(1:218,:);
    D2 = D(219:430,:);
    D3 = D(431:647,:);
    D4 = D(648:end,:);
    l1 = size(D1,1);
    l2 = size(D2,1);
    l3 = size(D3,1);
    l4 = size(D4,1);
    D1 = [D1';ones(1,l1)]';                                                    %The lable of 1st class samples
    D2 = [D2';2.*ones(1,l2)]';                                                 %The lable of 2ed class samples
    D3 = [D3';3.*ones(1,l3)]';                                                 %The lable of 1st class samples
    D4 = [D4';4.*ones(1,l4)]';
    BN = 4;
    Al = [];
    for i = 1 :10
        t01 = randperm(l1);
        t02 = randperm(l2);
        t03 = randperm(l3);
        t04 = randperm(l4);
        DD01 = D1;
        DD02 = D2;
        DD03 = D3;
        DD04 = D4;
        if i <= 2
            Te01 = DD01(t01((i-1)*21+1:i*21),:);
            DD01(t01((i-1)*21+1:i*21),:) = [];
            Te02 = DD02(t02((i-1)*22+1:i*22),:);
            DD02(t02((i-1)*22+1:i*22),:) = [];
        end
        if i > 2 && i < 10
            Te01 = DD01(t01(42+(i-3)*22+1:42+(i-2)*22),:);
            DD01(t01(42+(i-3)*22+1:42+(i-2)*22),:) = [];
            Te02 = DD02(t02(44+(i-3)*21+1:44+(i-2)*21),:);
            DD02(t02(44+(i-3)*21+1:44+(i-2)*21),:) = [];
        end
        if i == 10
            Te01 = DD01(t01(197:end),:);
            DD01(t01(197:end),:) = [];
            Te02 = DD02(t02(192:end),:);
            DD02(t02(192:end),:) = [];
        end
        if i <= 3
            Te03 = DD03(t03((i-1)*21+1:i*21),:);
            DD03(t03((i-1)*21+1:i*21),:) = [];
        end
        if i > 3 && i < 10
            Te03 = DD03(t03(63+(i-4)*22+1:63+(i-3)*22),:);
            DD03(t03(63+(i-4)*22+1:63+(i-3)*22),:) = [];
        end
        if i == 10
            Te03 = DD03(t03(196:end),:);
            DD03(t03(196:end),:) = [];
        end
        if i < 10
            Te04 = DD04(t04((i-1)*20+1:i*20),:);
            DD04(t04((i-1)*20+1:i*20),:) = [];
        else
            Te04 = DD04(t04(181:end),:);
            DD04(t04(181:end),:) = [];
        end
        Tr01 = DD01;
        Tr02 = DD02;
        Tr03 = DD03;
        Tr04 = DD04;
        TrainData = [Tr01;Tr02;Tr03;Tr04];
        TestData =  [Te01;Te02;Te03;Te04];
        %}
        
        %18--Vowel
        %{
    load Vowel.mat
    C = [A;B;C;D;E;F;G;H;I;J;K];
    C2 = tsne(C,'Algorithm','Exact','distance','mahalanobis','perplexity',50);
    D = normat(C2);
    n = size(D,1);
    A = 1 : n;
    D = [D';A]';
    D1 = D(1:90,:);
    D2 = D(91:180,:);
    D3 = D(181:270,:);
    D4 = D(271:360,:);
    D5 = D(361:450,:);
    D6 = D(451:540,:);
    D7 = D(541:630,:);
    D8 = D(631:720,:);
    D9 = D(721:810,:);
    D10 = D(811:900,:);
    D11 = D(901:end,:);
    l1 = size(D1,1);
    l2 = size(D2,1);
    l3 = size(D3,1);
    l4 = size(D4,1);
    l5 = size(D5,1);
    l6 = size(D6,1);
    l7 = size(D7,1);
    l8 = size(D8,1);
    l9 = size(D9,1);
    l10 = size(D10,1);
    l11 = size(D11,1);
    D1 = [D1';ones(1,l1)]';                                                    %The lable of 1st class samples
    D2 = [D2';2.*ones(1,l2)]';                                                 %The lable of 2ed class samples
    D3 = [D3';3.*ones(1,l3)]';
    D4 = [D4';4.*ones(1,l4)]';
    D5 = [D5';5.*ones(1,l5)]';
    D6 = [D6';6.*ones(1,l6)]';
    D7 = [D7';7.*ones(1,l7)]';
    D8 = [D8';8.*ones(1,l8)]';
    D9 = [D9';9.*ones(1,l9)]';
    D10 = [D10';10.*ones(1,l10)]';
    D11 = [D11';11.*ones(1,l11)]';
    BN = 11;
    Al = [];
    for i = 1 :10
        t01 = randperm(l1);
        t02 = randperm(l2);
        t03 = randperm(l3);
        t04 = randperm(l4);
        t05 = randperm(l5);
        t06 = randperm(l6);
        t07 = randperm(l7);
        t08 = randperm(l8);
        t09 = randperm(l9);
        t10 = randperm(l10);
        t11 = randperm(l11);
        DD01 = D1;
        DD02 = D2;
        DD03 = D3;
        DD04 = D4;
        DD05 = D5;
        DD06 = D6;
        DD07 = D7;
        DD08 = D8;
        DD09 = D9;
        DD10 = D10;
        DD11 = D11;
        Te01 = DD01(t01((i-1)*9+1:i*9),:);
        Te02 = DD02(t02((i-1)*9+1:i*9),:);
        Te03 = DD03(t03((i-1)*9+1:i*9),:);
        Te04 = DD04(t04((i-1)*9+1:i*9),:);
        Te05 = DD05(t05((i-1)*9+1:i*9),:);
        Te06 = DD06(t06((i-1)*9+1:i*9),:);
        Te07 = DD07(t07((i-1)*9+1:i*9),:);
        Te08 = DD08(t08((i-1)*9+1:i*9),:);
        Te09 = DD09(t09((i-1)*9+1:i*9),:);
        Te10 = DD10(t10((i-1)*9+1:i*9),:);
        Te11 = DD11(t11((i-1)*9+1:i*9),:);
        DD01(t01((i-1)*9+1:i*9),:) = [];
        DD02(t02((i-1)*9+1:i*9),:) = [];
        DD03(t03((i-1)*9+1:i*9),:) = [];
        DD04(t04((i-1)*9+1:i*9),:) = [];
        DD05(t05((i-1)*9+1:i*9),:) = [];
        DD06(t06((i-1)*9+1:i*9),:) = [];
        DD07(t07((i-1)*9+1:i*9),:) = [];
        DD08(t08((i-1)*9+1:i*9),:) = [];
        DD09(t09((i-1)*9+1:i*9),:) = [];
        DD10(t10((i-1)*9+1:i*9),:) = [];
        DD11(t11((i-1)*9+1:i*9),:) = [];
        Tr01 = DD01;
        Tr02 = DD02;
        Tr03 = DD03;
        Tr04 = DD04;
        Tr05 = DD05;
        Tr06 = DD06;
        Tr07 = DD07;
        Tr08 = DD08;
        Tr09 = DD09;
        Tr10 = DD10;
        Tr11 = DD11;
        TrainData = [Tr01;Tr02;Tr03;Tr04;Tr05;Tr06;Tr07;Tr08;Tr09;Tr10;Tr11];
        TestData =  [Te01;Te02;Te03;Te04;Te05;Te06;Te07;Te08;Te09;Te10;Te11];
        %}
        
        %19--waveform
        %{
    load waveform.mat
    C = [A;B;C];
    C2 = tsne(C,'distance','cityblock','perplexity',20,'Theta',0.1);
    D = normat(C2);
    n = size(D,1);
    A = 1 : n;
    D = [D';A]';
    D1 = D(1:1692,:);
    D2 = D(1693:3345,:);
    D3 = D(3346:end,:);
    l1 = size(D1,1);
    l2 = size(D2,1);
    l3 = size(D3,1);
    D1 = [D1';ones(1,l1)]';                                                    %The lable of 1st class samples
    D2 = [D2';2.*ones(1,l2)]';                                                 %The lable of 2ed class samples
    D3 = [D3';3.*ones(1,l3)]';
    BN = 3;
    Al = [];
    for i = 1 :10
        t01 = randperm(l1);
        t02 = randperm(l2);
        t03 = randperm(l3);
        DD01 = D1;
        DD02 = D2;
        DD03 = D3;
        if i <= 2
            Te1 = DD01(t01((i-1)*170+1:i*170),:);
            DD01(t01((i-1)*170+1:i*170),:) = [];
        end
        if i > 2 && i < 10
            Te1 = DD01(t01(340+(i-3)*169+1:340+(i-2)*169),:);
            DD01(t01(340+(i-3)*169+1:340+(i-2)*169),:) = [];
        end
        if i == 10
            Te1 = DD01(t01(1524:end),:);
            DD01(t01(1524:end),:) = [];
        end
        if i <= 3
            Te2 = DD02(t02((i-1)*166+1:i*166),:);
            DD02(t02((i-1)*166+1:i*166),:) = [];
        end
        if i > 3 && i < 10
            Te2 = DD02(t02(498+(i-4)*165+1:498+(i-3)*165),:);
            DD02(t02(498+(i-4)*165+1:498+(i-3)*165),:) = [];
        end
        if i == 10
            Te2 = DD02(t02(1489:end),:);
            DD02(t02(1489:end),:) = [];
        end
        if i <= 5
            Te3 = DD03(t03((i-1)*165+1:i*165),:);
            DD03(t03((i-1)*165+1:i*165),:) = [];
        end
        if i > 5 && i < 10
            Te3 = DD03(t03(825+(i-6)*166+1:825+(i-5)*166),:);
            DD03(t03(825+(i-6)*166+1:825+(i-5)*166),:) = [];
        end
        if i == 10
            Te3 = DD03(t03(1490:end),:);
            DD03(t03(1490:end),:) = [];
        end
        Tr1 = DD01;
        Tr2 = DD02;
        Tr3 = DD03;
        TrainData = [Tr1;Tr2;Tr3];
        TestData = [Te1;Te2;Te3];
        %}
        
        %20--wine
        %
    load wine.mat
    C = [One;Two;Thr];
    C2 = tsne(C,'Algorithm','Exact','distance','seuclidean','perplexity',50);
    D = normat(C2);
    n = size(D,1);
    A = 1 : n;
    D = [D';A]';
    D1 = D(1:59,:);
    D2 = D(60:131,:);
    D3 = D(132:end,:);
    l1 = size(D1,1);
    l2 = size(D2,1);
    l3 = size(D3,1);
    D1 = [D1';ones(1,l1)]';                                                    %The lable of 1st class samples
    D2 = [D2';2.*ones(1,l2)]';                                                 %The lable of 2ed class samples
    D3 = [D3';3.*ones(1,l3)]';
    BN = 3;
    Al = [];
    for i = 1 :10
        t01 = randperm(l1);
        t02 = randperm(l2);
        t03 = randperm(l3);
        DD1 = D1;
        DD2 = D2;
        DD3 = D3;
        if i < 10
            Te1 = DD1(t01((i-1)*6+1:i*6),:);
            DD1(t01((i-1)*6+1:i*6),:) = [];
        else
            Te1 = DD1(t01(55:end),:);
            DD1(t01(55:end),:) = [];
        end
        if i <= 8
            Te2 = DD2(t02((i-1)*7+1:i*7),:);
            DD2(t02((i-1)*7+1:i*7),:) = [];
        end
        if i > 8 && i < 10
            Te2 = DD2(t02(56+(i-9)*8+1:56+(i-8)*8),:);
            DD2(t02(56+(i-9)*8+1:56+(i-8)*8),:) = [];
        end
        if i == 10
            Te2 = DD2(t02(65:end),:);
            DD2(t02(65:end),:) = [];
        end
        if i <= 3
            Te3 = DD3(t03((i-1)*4+1:i*4),:);
            DD3(t03((i-1)*4+1:i*4),:) = [];
        end
        if i > 3 && i < 10
            Te3 = DD3(t03(12+(i-4)*5+1:12+(i-3)*5),:);
            DD3(t03(12+(i-4)*5+1:12+(i-3)*5),:) = [];
        end
        if i == 10
            Te3 = DD3(t03(43:end),:);
            DD3(t03(43:end),:) = [];
        end
        Tr1 = DD1;
        Tr2 = DD2;
        Tr3 = DD3;
        TrainData = [Tr1;Tr2;Tr3];
        TestData = [Te1;Te2;Te3];
        %}
%main
    nn = size(TestData,1);
    tnn = randperm(nn);
    TestData = TestData(tnn(1,:),:);
    %initializing memory cell
    if ~isempty(TrainData)
        mm = size(TrainData,1);
        di = size(TrainData,2) - 2;
       [Grids,Grs] = InitG(TrainData,mingen,BN);                           %classification and clustering    
       tn = size(TestData,1);
       %Basic Learning Testing
       %{
            for ii = 1 : tn
                [yczq] = JTestfun(Grids,Grs,TestData(ii,:));     %Right 1, wrong 0, fail to recognise temporarily 0.5
                Al = [Al;yczq];
            end
            %}
        %Continual Learning Testing       
       %
            for ii = 1 : tn
                [yczq,Grids,Grs] = CTestfun(Grids,Grs,TestData(ii,:),mingen);    
               %[yczq,Grids,Grs] = ATestfun(Grids,Grs,TestData(ii,:),mingen);     %Right 1, wrong 0, fail to recognise temporarily 0.5
                Al = [Al;yczq];
            end
    %}
%     DrawGrid1(Grids,Grs,j)
%     DrawGrid2(Grids,Grs,j)
    end
    dr(j) = sum(Al) / n * 100;
    end
end  
DR = mean(dr)
st = std(dr',0,1)

%%
%Adjusting memory cells with vaccine
function [Grids,Grs] = AdjustV(Grids,Grs,Data,mingen)
%gdj is the passage of memory cell for adjusting
%Data:vaccine
%data:[d1,d2,...,dn,label]
%Grids:[d1,d2,...,dn,p,t1,t2,...,tm]
%di:dimension
%t:types
tt = size(Grids,1);
di = size(Grids,2) - 3;
for ii = 1:tt
    [A] = IsSampleinGrid(Grids(ii,:),Data);  
    if ~isempty(A)
        Grs{ii} = [Grs{ii};A];
        N = unique(Grs{ii}(:,di+2));
        if Grids(ii,end) == 0
            if Grids(ii,di+1) < mingen
                [TempG,TempS] = Xfvfun(Grids(ii,:),Grids(ii,di+1),Grs{ii},mingen);
                Grids(ii,di+2) = 999999;
                Grids = [Grids;TempG];
                Grs = [Grs;TempS];                
            else
                Grids(ii,di+2) = max(N);
                Grids(ii,di+3) = size(Grs{ii},1);                
            end
        else
            if size(N,1) == 1
                Grids(ii,di+2) = N;
                Grids(ii,di+3) = size(Grs{ii},1);
            else
                [TempG,TempS] = Xfvfun(Grids(ii,:),Grids(ii,di+1),Grs{ii},mingen);
                Grids(ii,di+2) = 999999;
                Grids = [Grids;TempG];
                Grs = [Grs;TempS];
            end
        end
    end
end
AA = find(Grids(:,di+2) == 999999);
if ~isempty(AA)
    Grids(AA(:,1),:) = [];
    Grs(AA(:,1),:) = [];
end
end


%%
%Divide memory cell
function [Grids,Grs]= Xfvfun(grid,xfdj,data,mingen)
dltyd = 1 / 2^(xfdj+1);                                                    %The length of other divide memory cell
yd = 0.5 * dltyd;
di = size(data,2) - 2;

x = [];
A = [];
for i = 1 : di
    x(i,:) = [grid(i) - yd grid(i) + yd];
    A = [A 2];
end
ind = fullfact(A);
Temp = [];
for i = 1 : di
    Temp = [Temp; x(i,ind(:,i))];
end
Temp = [Temp' (xfdj+1).*ones(2^di,1) zeros(2^di,2)];
for i = 1 : 2^di
    Grs{i,1} = [];
end
[Grids,Grs] = AdjustV(Temp,Grs,data,mingen);
end

%%
%Adaptive Continual Learning Test stadge
function [yclx,Grids,Grs] = ATestfun(Grids,Grs,data,mingen)
di = size(data,2) - 2;
flag = 1;
ii = 1;
while flag
    [A] = IsSampleinGrid(Grids(ii,:),data);
    if ~isempty(A)
        if Grids(ii,di+2) == 0                                             %The sample in a empty memory cell, need adjacent memory cells to detect its class
            if Grids(ii,di+1) < mingen
                [TGrids,TGrs] = SuboneG(Grids(ii,:),data,mingen-1);         %The memory cell is not the smallest memory cell
                A = find(TGrids(:,di+1) == mingen & TGrids(:,di+3) == 1);
                Tem = TGrids(A(1,1),:);
                [nadwg] = FNxlwgfun(Tem,Grids);
                [templx] = ConfirmC(nadwg,data);
                TGrids(A(1,1),di+2) = templx;
                TGrids(A(1,1),di+3) = 1;
                Grids(ii,:) = [];
                Grs(ii,:) = [];
                Grids = [Grids;TGrids];
                Grs = [Grs;TGrs];
            else
                [nadwg] = FNxlwgfun(Grids(ii,:),Grids);                    %The grid is the smallest memory cell
                [templx] = ConfirmC(nadwg,data);
                Grids(ii,di+2) = templx;
                Grids(ii,di+3) = 1;
                Grs{ii} = [Grs{ii};data];
            end
            
            if abs(templx) == data(end) 
                yclx = 1;
            else
                yclx = 0;
            end
            if templx == 0.5                                               
                yclx = 0.5;
            end
        else                                                               %The sample in a nonempty memory cell
            if abs(Grids(ii,di+2)) == data(end)                            %If they have the same class return 1, else return 0                                      
                yclx = 1;
            else
                yclx = 0;
            end
            if Grids(ii,di+2) == 0.5                                       %%%%%%%%%%%%
                yclx = 0.5;
            end
            Grids(ii,di+3) = Grids(ii,di+3) + 1;
            Grs{ii} = [Grs{ii};data];
        end
        flag = 0;
    end
    ii = ii + 1;
    if ii == size(Grids,1)
        yclx = 0;
        break
    end
end

end



%%
%Confirm the classification of test sample
function [templx] = ConfirmC(nadwg,data)
di = size(nadwg,2) - 3;
mindj = max(nadwg(:,di+1));
adlxn = unique(nadwg(:,di+2));
adn = size(adlxn,1);
if adn == 1                                                                %If only one type and empty adjacent memory cell
    templx = 0.5;
end
if adn > 1                                                                 %If more than one type adcacent memory cell
    for jj = 1 : adn                                                       %Calculate the weight of every type memory cell
        T0 = find(nadwg(:,di+2) == adlxn(jj));
        T1 = nadwg(T0(:),:);
        T2 = 1 ./ 2.^(T1(:,di+1)) .* T1(:,di+3);
        TT(jj) = sum(T2);
    end
    [TE0,TE1] = sort(TT);  
    if TE0(end) == TE0(end-1)                                              %If the memory cell have same weight
        for jj = 1 : adn                                                   %Calculte the distance between test smaple and memory cell center
            S0 = find(nadwg(:,di+2) == adlxn(jj));
            S1 = nadwg(S0(:),:);
            S2 = dist(S1(:,1:di),data(1:di)')-0.5.*0.5.^S1(:,di+1);
            SS(jj) = sum(S2);
        end
        [SE0,SE1] = sort(SS);
        SR1 = find(nadwg(:,di+2) == adlxn(SE1(1)));
        srn1 = size(SR1,1);
        if srn1 > 1
            templx = adlxn(SE1(1));                                        %The test sapmle belong to the nearest memory cell%%%%%%
        else
            SR2 = find(nadwg(SR1(1,1),di+1) == mindj && nadwg(SR1(1,1),di+2) ~= 0.5);
            if ~isempty(SR2)
                templx = -adlxn(SE1(1));
            else
                templx = adlxn(SE1(1));
            end
        end
    else
        TR1 = find(nadwg(:,di+2) == adlxn(TE1(end)));
        trn1 = size(TR1,1);
        if trn1 > 1        
            templx = adlxn(TE1(end));                                      %The test sample belong to the weightest memory cell%%%%%%
        else
            TR2 = find(nadwg(TR1(1,1),di+1) == mindj && nadwg(TR1(1,1),di+2) ~= 0.5);
            if ~isempty(TR2)
                templx = -adlxn(TE1(end));
            else
                templx = adlxn(TE1(end));
            end            
        end
    end
end
end
%%
%Continue Test stadge
function [yclx,Grids,Grs] = CTestfun(Grids,Grs,data,mingen)
di = size(data,2) - 2;
flag = 1;
ii = 1;
while flag
    [A] = IsSampleinGrid(Grids(ii,:),data);
    if ~isempty(A)
        if Grids(ii,di+2) == 0                                             %The sample in a empty memory cell, need adjacent memory cells to detect its class
            if Grids(ii,di+1) < mingen
                [TGrids,TGrs] = SuboneG(Grids(ii,:),data,mingen-1);
                A = find(TGrids(:,di+1) == mingen & TGrids(:,di+3) ~= 0);
                Tem = TGrids(A(1,1),:);
                [adwg] = Fxlwgfun(Tem,Grids);
                templx = Cconfirm(adwg,data);
                TGrids(A(1,1),di+2) = templx;
                TGrids(A(1,1),di+3) = TGrids(A(1,1),di+3)+dist(TGrids(A(1,1),1:di),data(1:di)')*2^TGrids(A(1,1),di+1)*2/sqrt(di);
                Grids(ii,:) = [];
                Grs(ii,:) = [];
                Grids = [Grids;TGrids];
                Grs = [Grs;TGrs];
            else
                [adwg] = Fxlwgfun(Grids(ii,:),Grids);
                templx = Cconfirm(adwg,data);
                Grids(ii,di+2) = templx;
                Grids(ii,di+3) = Grids(ii,di+3)+dist(Grids(ii,1:di),data(1:di)')*2^Grids(ii,di+1)*2/sqrt(di);
                Grs{ii} = [Grs{ii};data];
            end
            if templx == data(end) 
                yclx = 1;
            else
                yclx = 0;
            end
        else                                                               %The sample in a nonempty memory cell
            Grids(ii,di+3) = Grids(ii,di+3) + dist(Grids(ii,1:di),data(1:di)')*2^Grids(ii,di+1)*2/sqrt(di);
            Grs{ii} = [Grs{ii};data];
            if Grids(ii,di+2) == data(end)                                 %If they have the same class return 1, else return 0                                      
                yclx = 1;
            else
                yclx = 0;
            end
        end
        flag = 0;
    end
    ii = ii + 1;
end

end

%%
%Confirm the classification of test sample in Ctest
function [templx] = Cconfirm(adwg,data)
di = size(adwg,2) - 3;
adlxn = unique(adwg(:,di+2));
adn = size(adlxn,1);
if adn == 1                                                                %If only one adjacent memory cell
    templx = adlxn(1);
end
if adn > 1                                                                 %If more than one adcacent memory cell
    for jj = 1 : adn
        T0 = find(adwg(:,di+2) == adlxn(jj));
        T1 = adwg(T0(:),:);
        T2 = 1 ./ 2.^(T1(:,di+1)) .* T1(:,di+3);
        TT(jj) = sum(T2);
    end
    minT = min(TT);
    maxT = max(TT);
    if minT == maxT
        for jj = 1 : adn
            S0 = find(adwg(:,di+2) == adlxn(jj));
            S1 = adwg(S0(:),:);
            S2 = dist(S1(:,1:di),data(1:di)')-0.5.*0.5.^S1(:,di+1);
            SS(jj) = sum(S2);
        end
        [E0,E1] = sort(SS);
        templx = adlxn(E1(1));
    else
        [E0,E1] = sort(TT);
        templx = adlxn(E1(end));
    end
end
end
%%
%Static Test stadge
function [yclx] = JTestfun(Grids,Grs,data)
di = size(data,2) - 2;
flag = 1;
ii = 1;
while flag
    [A] = IsSampleinGrid(Grids(ii,:),data);
    if ~isempty(A)
        if Grids(ii,di+2) == 0                                             %The sample in a empty memory cell, need adjacent memory cells to detect its class
            mindj = max(Grids(:,di+1));
            if Grids(ii,di+1) < mindj
                [TGrids,TGrs] = SuboneG(Grids(ii,:),data,mindj-1);
                A = find(TGrids(:,di+1) == mindj & TGrids(:,di+3) ~= 0);
                Tem = TGrids(A(1,1),:);
                [adwg] = Fxlwgfun(Tem,Grids);
            else
                [adwg] = Fxlwgfun(Grids(ii,:),Grids);
            end
            adlxn = unique(adwg(:,di+2));
            adn = size(adlxn,1);
            if adn == 1                                                    %If only one adjacent memory cell
                templx = adlxn(1);
            end
            if adn > 1                                                     %If more than one adcacent memory cell
                for jj = 1 : adn
                    T0 = find(adwg(:,di+2) == adlxn(jj));
                    T1 = adwg(T0(:),:);
                    T2 = 1 ./ 2.^(T1(:,di+1)) .* T1(:,di+3); 
                    TT(jj) = sum(T2);
                end
                minT = min(TT);
                maxT = max(TT);
                if minT == maxT
                    for jj = 1 : adn
                        S0 = find(adwg(:,di+2) == adlxn(jj));
                        S1 = adwg(S0(:),:);
                        S2 = dist(S1(:,1:di),data(1:di)')-0.5.*0.5.^S1(:,di+1);
                        SS(jj) = sum(S2);
                    end
                    [E0,E1] = sort(SS);
                    templx = adlxn(E1(1));                    
                else
                    [E0,E1] = sort(TT);
                    templx = adlxn(E1(end));
                end
            end
            
            if templx == data(end) 
                yclx = 1;
            else
                yclx = 0;
            end
        else                                                               %The sample in a nonempty memory cell
            if Grids(ii,di+2) == data(end)                                 %If they have the same class return 1, else return 0                                      
                yclx = 1;
            else
                yclx = 0;
            end
        end
        flag = 0;
    end
    ii = ii + 1;
end

end


%%
%To find the nearest adjacent memory cells 
function [nxlwg,xlwgn] = FNxlwgfun(zx,Grids)
di = size(zx,2) - 3;
dqdj = zx(di+1);
dltyd = 1 / 2^dqdj;
Tempwg = [];
Tempwgn = [];
data = [];
x = [];
for i = 1 : di
    x(i,:) = zx(i)-dltyd : dltyd : zx(i)+dltyd;
end
A = [];
sym xx;
for i = 1 : di
    AA = find(x(i,:) > 0 & x(i,:) < 1);
    A = [A length(AA)];
    xx{i} = x(i,AA(1,:));
end
ind = fullfact(A);
data = [];
for i = 1 : di
    A = xx{i};
    data = [data; A(ind(:,i))];
end
data = data';

flagd = 1;
i = 1;
Tempd = data;
while flagd && i <= di
    L = zx(i) - 0.5 * dltyd;
    R = zx(i) + 0.5 * dltyd;
    
    A = find(Tempd(:,i) <= R & Tempd(:,i) >= L);
    
    if isempty(A) || isempty(data)
        flagd = 0;
    else
        TempA = A;
        Tempd = Tempd(A(:,1),:);
    end
    i = i + 1;
end
data(TempA(:,1),:) = [];

tt = size(Grids,1);
for i = 1 : tt
    [A] = IsSampleinGrid(Grids(i,:),data);
    if ~isempty(A)
        Tempwg = [Tempwg; Grids(i,:)];
        Tempwgn = [Tempwgn;i];
    end
end
nxlwg = Tempwg;
xlwgn = Tempwgn;
end


%%
%To find the adjacent memory cells
function [xlwg] = Fxlwgfun(zx,Grids)
di = size(zx,2) - 3;
dqdj = zx(di+1);
dltyd = 1 / 2^dqdj;
flag = 1;
fi = 1;
while flag
    Tempwg = [];
    data = [];
    x = [];
    for i = 1 : di
        x(i,:) = zx(i)-fi*dltyd : dltyd : zx(i)+fi*dltyd;
    end
    A = [];
    sym xx;
    for i = 1 : di
        AA = find(x(i,:) > 0 & x(i,:) < 1);
        A = [A length(AA)];
        xx{i} = x(i,AA(1,:));
    end
    ind = fullfact(A);
    data = [];
    for i = 1 : di
        A = xx{i};
        data = [data; A(ind(:,i))];
    end
    data = data';
    
    Tempd = data;
    A = find(Tempd(:,1) == zx(:,1) & Tempd(:,2) == zx(:,2));
    data(A,:) = [];
    
    tt = size(Grids,1);
    for i = 1 : tt
        if Grids(i,di+2) ~= 0
            [A] = IsSampleinGrid(Grids(i,:),data);
            if ~isempty(A)
                Tempwg = [Tempwg; Grids(i,:)];
            end
        end
    end
    if ~isempty(Tempwg)
        flag = 0;
    else
        fi = fi + 1;
    end
end
xlwg = Tempwg;
end


%%
%initializing memory cells
function [Grids,Grs] = InitG(Data,mingen,BN)
%Grs records the samples in every memory cell
%Data=[sample lable]

di = size(Data,2) - 2;                                                     %The dimensionality of Data

GC = 0.5 .* ones(1,di);
%1-di,center of grid; di+1,grade; di+2,lable; di+3, cell cores;
Grids(1,:) = [GC 0 0 0];                                                   %The initial center, grade, lable and sample size of every memory cell
Grs{1,1} = [];

%Adaptive to generate memory cells
[Grids,Grs] = AdjustG(Grids,Grs,0,Data,mingen);                                   %Adaptive to generate memory cells
%DrawGrid1(Grids,Grs,2)
m = size(Grids,1);
for t = 1 : m
    n = size(Grs{t},1);
    if ~isempty(n)&&Grids(t,di+2)~=4.9999
        for i = 1:n
            Grids(t,di+3) = Grids(t,di+3)+dist(Grids(t,1:di),Grs{t}(i,1:di)')*2^Grids(t,di+1)*2/sqrt(di);
        end
    end
end
for i = 1 : BN
    idx = find(Grids(:,di+2) == i);
    if isempty(idx)
        lev = max(Grids(:,di+1));
    else
        CC = Grids(idx,:);
        lev = maxnumgen(CC,mingen);
    end
    lable = i;
    %DrawGrid1(Grids,Grs,i)
    %totipotent primitive cell's function
    [Grids,Grs] = backandclone(Grids,Grs,lev,lable);
    %DrawGrid1(Grids,Grs,BN+i)
    %Divide the memory cell which has one sample to the totipotent primitive cell's generation
    [Grids,Grs] = DivtominG(Grids,Grs,lev,lable);
end
AA = find(Grids(:,di+2) == 4.9999);
if ~isempty(AA)
    Grids(AA(:,1),:) = [];
    Grs(AA(:,1),:) = [];
end
end

%%
%Adjusting memory cells and samples
function [Grids,Grs] = AdjustG(Grids,Grs,gdj,Data,mingen)
%gdj is the grade of memory cell for adjusting
tt = size(Grids,1);
di = size(Data,2) - 2;
gsn = mingen + 4;
for ii = 1:tt
    [A] = IsSampleinGrid(Grids(ii,:),Data);
    Grs{ii} = A;   
    if ~isempty(A)
        N = unique(Grs{ii}(:,di+2));
        L = size(A,1);
        if Grids(ii,di+1) < gsn 
            if L > 1 || Grids(ii,di+1) <= mingen  
                [TempG,TempS] = Xfwgfun(Grids(ii,:),gdj,Grs{ii},mingen);          %Divide memory cell
                Grids(ii,di+2) = 4.9999;
                Grids = [Grids;TempG];
                Grs = [Grs;TempS];
            else
                Grids(ii,di+2) = N;
            end
        else
            Grids(ii,di+2) = mode(Grs{ii}(:,di+2));
        end
    end
end
AA = find(Grids(:,di+2) == 4.9999 & Grids(:,di+1) < mingen-1 );
if ~isempty(AA)
    Grids(AA(:,1),:) = [];
    Grs(AA(:,1),:) = [];
end
end


%%
%The sample in or not in a memory cell
function [data] = IsSampleinGrid(grid,Data)
di = size(grid,2) - 3;
dltyd = 1 / 2^grid(di+1);
nn = size(Data,1);
AData = [];
for j = 1 : nn
    singleData = Data(j,:);
    i = 1;
    flag = 1;
while flag && i <= di
    L = grid(i) - 0.5 * dltyd;
    R = grid(i) + 0.5 * dltyd;
    if singleData(:,i) <= R && singleData(:,i) >= L
        if i == di
            AData = [AData;Data(j,:)];
        end
    else
        flag = 0;
    end
    i = i + 1;
end
end
data = AData;
end


%%
%Divide the memory cell which has one sample to the smallest memory cell
function [TGrids,TGrs] = SuboneG(grid,data,xfdj)
di = size(data,2) - 2;
dqdj = grid(di+1);
Temp = [];
Tempg = [];
TGrids = [];
TGrs = [];
if dqdj < xfdj
    dltyd = 1 / 2^(dqdj+1);
    yd = 0.5 * dltyd;
    x = [];
    A = [];
    for i = 1 : di
        x(i,:) = [grid(i) - yd grid(i) + yd];
        A = [A 2];
    end
    ind = fullfact(A);
    Temp = [];
    for i = 1 : di
        Temp = [Temp; x(i,ind(:,i))];
    end
    Temp = [Temp' (dqdj+1).*ones(2^di,1) zeros(2^di,2)];  
    for i = 1 : 2^di
        Tempg{i,1} = [];
    end
    j = 1;
    flagt = 1;
    while flagt && j <= 2^di
        [A] = IsSampleinGrid(Temp(j,:),data);
        if ~isempty(A)
            Tempg{j} = data;
            Temp(j,di+3) = Temp(j,di+3)+dist(Temp(j,1:di),data(1:di)')*2^Temp(j,di+1)*2/sqrt(di);
            Temp(j,di+2) = grid(di+2);
            [TGrids,TGrs] = SuboneG(Temp(j,:),data,xfdj);
            Temp(j,di+2) = 999999;
            flagt = 0;
        else
            j = j + 1;
        end
    end
    TGrids = [TGrids;Temp];
    TGrs = [TGrs;Tempg];
else
    dltyd = 1 / 2^(dqdj+1);
    yd = 0.5 * dltyd;
    x = [];
    A = [];
    for i = 1 : di
        x(i,:) = [grid(i) - yd grid(i) + yd];
        A = [A 2];
    end
    ind = fullfact(A);
    Temp = [];
    for i = 1 : di
        Temp = [Temp; x(i,ind(:,i))];
    end   
    Temp = [Temp' (dqdj+1).*ones(2^di,1) zeros(2^di,2)];   
    for i = 1 : 2^di
        Tempg{i,1} = [];
    end
    j = 1;
    flagt = 1;
    while flagt && j <= 2^di
        [A] = IsSampleinGrid(Temp(j,:),data);
        if ~isempty(A)
            Tempg{j} = data;
            Temp(j,di+3) = Temp(j,di+3)+dist(Temp(j,1:di),data(1:di)')*2^Temp(j,di+1)*2/sqrt(di);
            Temp(j,di+2) = grid(di+2);
            flagt = 0;
        else
            j = j + 1;
        end
    end
    TGrids = [TGrids;Temp];
    TGrs = [TGrs;Tempg];
end
AA = find(TGrids(:,di+2) == 999999);
if ~isempty(AA)
    TGrids(AA(:,1),:) = [];
    TGrs(AA(:,1),:) = [];
end
end


%%
%Divide memory cell
function [Grids,Grs]= Xfwgfun(grid,xfdj,data,mingen)
dltyd = 1 / 2^(xfdj+1);                                                    %The length of other divide memory cell
yd = 0.5 * dltyd;
di = size(data,2) - 2;

x = [];
A = [];
for i = 1 : di
    x(i,:) = [grid(i) - yd grid(i) + yd];
    A = [A 2];
end
ind = fullfact(A);
Temp = [];
for i = 1 : di
    Temp = [Temp; x(i,ind(:,i))];
end
Temp = [Temp' (xfdj+1).*ones(2^di,1) zeros(2^di,2)];
for i = 1 : 2^di
    Grs{i,1} = [];
end
[Grids,Grs] = AdjustG(Temp,Grs,xfdj+1,data,mingen);
end
%%
%To find super memory cells' generation
function [supgen] = maxnumgen(Grids,mingen)
    di = size(Grids,2) - 3;
    for i = mingen : mingen + 4
        n = find(Grids(:,di+1) == i);
        x(i) = length(n);
    end
    [~,supgen] = max(x);
end

%%
function [Grids,Grs] = backandclone(Grids,Grs,lev,lable)
di = size(Grids,2)-3;
minlev = max(Grids(:,di+1));
mm = size(Grids,1);
for nn = 1 : minlev-lev+1                                                  %generation from minlev to lev
    for tt = 1 : mm                                                        %search daughter cell
        if Grids(tt,di+1) == minlev + 1 - nn && Grids(tt,di+2) == lable && Grids(tt,di+3) ~= 1
            for cc = 1:di
                x(cc) = Grs{tt,1}(1,cc);                                   %record daughyer cell's antibody coordinates in x
            end
            ca = 0;
            for q = nn : minlev-lev+1                                      %to flash back
                ca = ca + 1;                                               %ca is a loop label
                for bb = 1: mm                                             %search the father cell which contain the antibody
                    if bb ~= tt && Grids(bb,di+1) == minlev - q && Grids(bb,di+2) == 4.9999
                        flag = 0;
                        for cc = 1 : di                                    %judge in di dimensions
                            aa = find(Grs{bb,1}(:,cc)==x(cc), 1);
                            if ~isempty(aa)
                                flag = flag + 1;
                            end
                        end
                        if flag == di
                            break                                          %now the homologous father cell is recorded as bb
                        end
                    end
                end
                if bb == mm
                    break                                                  %if there is no homologous father cell
                end
                dltyd = 1 / 2^Grids(bb,di+1);                              %size of the father cell
                for cc = 1:di
                    R(cc) = Grids(bb,cc) + 0.5 * dltyd;
                    r(cc) = R(cc)-x(cc);                                   %relative coordinates(antibody in father cell)
                end
                for ee = 1 : mm                                            %search other father cells to reproduce
                    if Grids(ee,di+2) == lable && Grids(ee,di+1) == minlev-q && Grids(ee,di+1) ~= lev-1
                        temp = [];
                        for cc = 1:di
                            R(cc) = Grids(ee,cc) + 0.5 * dltyd;
                            xx(cc) = R(cc) - r(cc);                        %absolute coordinates
                            temp = [temp xx(cc)];
                        end
                        d = dist(Grids(ee,1:di),xx');
                        Grids(ee,di+3) = Grids(ee,di+3) + d/dist(x,xx');
                        temp = [temp 0 Grids(tt,di+2)];
                        Grs{ee,1} = [Grs{ee,1};temp];                      %reproduce
                    end
                    if Grids(ee,di+2) == 0 && Grids(ee,di+1) == minlev - q && ca == 1 && nn == 1
                        for cc = 1:di
                            L(cc) = x(cc) - Grids(ee,cc);
                        end
                        if sum(L.*L,2) <= dltyd^2                          %whether to reproduce in adjacent cells
                            temp = [];
                            for cc = 1:di
                                R(cc) = Grids(ee,cc) + 0.5 * dltyd;
                                xx(cc) = R(cc) - r(cc);                    %absolute coordinates
                                temp = [temp xx(cc)];
                            end
                            temp = [temp 0 Grids(tt,di+2)];
                            Grs{ee,1} = [Grs{ee,1};temp];
                            Grids(ee,di+2) = lable;
                            Grids(ee,di+3) = dist(Grids(ee,1:di),xx')*2^Grids(ee,di+1)*2/sqrt(di);
                        end
                    end
                end
            end
        end
    end
    %DrawGrid1(Grids,Grs,nn)
end
end
%%
%Divide the memory cell which has one sample to the smallest memory cell
function [Grids,Grs] = DivtominG(Grids,Grs,mingen,lable)
di = size(Grids,2) - 3;
AA = find(Grids(:,di+1) < mingen & Grids(:,di+2) == lable);                %Find the memory cell which has one sample
if ~isempty(AA)
    nn = size(AA,1);
    for i = 1 : nn
        ii = AA(i,1);
        [TGrids,TGrs] = SuboneG(Grids(ii,:),Grs{ii},mingen-1);             %Divide the memory cell which has one sample to the smallest memory cell
        Grids(ii,di+2) = 999999;
        Grids = [Grids;TGrids];
        Grs = [Grs;TGrs];
    end
end
AA = find(Grids(:,di+2) == 999999);
if ~isempty(AA)
    Grids(AA(:,1),:) = [];
    Grs(AA(:,1),:) = [];
end
end

%%
%normalize data to [0.000001,0.999999]n
function [Dn] = normat(D)
if max(D) == 0
    Dn = zeros(size(D,1),1);
else
    Dn = 0.0001+0.9998.*(D - min(D)) ./ (max(D) - min(D));
end
end
%%
%Drawing memory cell in [0,1]^2
function DrawGrid2(Grids,~,k)
%k is the figure number
tt = size(Grids,1);
figure(k)
hold on
for fi = 1 : tt
    dltyd = 1 / 2^Grids(fi,3);
    L = Grids(fi,1) - 0.5 * dltyd;
    R = Grids(fi,1) + 0.5 * dltyd;
    U = Grids(fi,2) + 0.5 * dltyd;
    B = Grids(fi,2) - 0.5 * dltyd;
    if Grids(fi,4) > 0
        cc = abs([0.2 0.2 0.2] .* Grids(fi,4));
        X = [L L R R];
        Y = [B U U B];
        fill(X,Y,cc)
    end
    plot([L;L;R;R;L],[B;U;U;B;B],'g-');
end
plot([0,1],[1,1],'k-');
plot([0,1],[0,0],'k-');
plot([0,0],[1,0],'k-');
plot([1,1],[1,0],'k-');
axis equal;
axis off
set(gcf,'color','w')
end
%%
%Drawing memory cell in [0,1]^2
function DrawGrid1(Grids,Grs,k)
%k is the figure number
tt = size(Grids,1);
figure(k)
hold on
for fi = 1 : tt
    dltyd = 1 / 2^Grids(fi,3);
    L = Grids(fi,1) - 0.5 * dltyd;
    R = Grids(fi,1) + 0.5 * dltyd;
    U = Grids(fi,2) + 0.5 * dltyd;
    B = Grids(fi,2) - 0.5 * dltyd;
    if Grids(fi,4) > 0
        cc = abs([0.2 0.2 0.2] .* Grids(fi,4));
        X = [L L R R];
        Y = [B U U B];
        %fill(X,Y,cc)
        p = size(Grs{fi},1);
        for i = 1 : p
        if Grs{fi}(i,4) == 1
            plot(Grs{fi,1}(i,1),Grs{fi,1}(i,2),'b.');
        end
        if Grs{fi}(i,4) == 2
            plot(Grs{fi,1}(i,1),Grs{fi,1}(i,2),'k.');
        end
        if Grs{fi}(i,4) == 3
            plot(Grs{fi,1}(i,1),Grs{fi,1}(i,2),'r.');
        end
        if Grs{fi}(i,4) == 4
            plot(Grs{fi,1}(i,1),Grs{fi,1}(i,2),'o.');
        end
        if Grs{fi}(i,4) == 5
            plot(Grs{fi,1}(i,1),Grs{fi,1}(i,2),'b^');
        end
        if Grs{fi}(i,4) == 6
            plot(Grs{fi,1}(i,1),Grs{fi,1}(i,2),'k^');
        end
        if Grs{fi}(i,4) == 7
            plot(Grs{fi,1}(i,1),Grs{fi,1}(i,2),'g^');
        end
        end
    end
    plot([L;L;R;R;L],[B;U;U;B;B],'g-');
end
plot([0,1],[1,1],'k-');
plot([0,1],[0,0],'k-');
plot([0,0],[1,0],'k-');
plot([1,1],[1,0],'k-');
axis equal;
axis off
set(gcf,'color','w')
end
