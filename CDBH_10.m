clear all;
clc;
dataset_name = 'KEEL';
ktimes = 5;
index =1:44;

warning('off','all');

for i_index = 1:1
    
    Density_final_minor=[];Index_final_minor=[];Density_final_major=[];Index_final_major=[];
    
    AUC_avg=[];F_measure_avg=[];Rate_over_avg=[];Rate_supportvectors_avg=[];Rate_decrease_avg=[];Rate_increase_avg=[];IR_updated_avg=[];
    Acc_avg=[];
    
    for i_avg = 1:10
        i_avg
        %%%%%% Loading datasets %%%%%%
        %{
        load diabetes.mat
        C = [O;Z];
        D = normat(C);
        DH1 = D(1:268,:);
        DH2 = D(269:768,:);
        l1 = size(DH1,1);
        l2 = size(DH2,1);
        DH1 = [DH1';2.*ones(1,l1)]';                                                    %The lable of 1st class samples
        DH2 = [DH2';ones(1,l2)]';
        for i_cv= 1 :1
            tt1 = ceil(l1*0.05);                                                        %The number of training samples
         tt2 = ceil(l2*0.05);
         DD1 = DH1;
         DD2 = DH2;
         t1 = randperm(l1);                                                     %Rrandomly selecte training data
         t2 = randperm(l2);
         Tr1 = DD1(t1(1:tt1),:);                                                %The 1st class samples for training
         Tr2 = DD2(t2(1:tt2),:);                                                %The 2ed class samples for training
         DD1(t1(1:tt1),:) = [];
         DD2(t2(1:tt2),:) = [];
         Te1 = DD1;                                                             %The 1st class samples for testing
         Te2 = DD2;                                                             %The 2ed class samples for testing
         TrainData = [Tr1;Tr2];
         TestData = [Te1;Te2];
             nn = size(TestData,1);
    tnn = randperm(nn);
    TestData = TestData(tnn(1,:),:);
%          divfour = ceil(size(TestData,1)*0.05);
%          TestData = TestData(1 :divfour*2+1,:);
%          TestData = TestData(divfour*1+1 :divfour*2+1,:);
%           TestData = TestData(divfour*2+1 :divfour*3+1,:);
%     TestData = TestData(divfour*3+1 :end,:);
        %}
        %{
        %3--Haberman
        load Haberman.mat
        C = [one;two];
        D = normat(C);
        DH1 = D(1:225,:);
        DH2 = D(226:306,:);
        l1 = size(DH1,1);
        l2 = size(DH2,1);
        DH1 = [DH1';ones(1,l1)]';                                                    %The lable of 1st class samples
        DH2 = [DH2';2.*ones(1,l2)]';                                                 %The lable of 2ed class samples
        for i_cv = 1 :1
         tt1 = ceil(l1*0.05);                                                        %The number of training samples
         tt2 = ceil(l2*0.05);
         DD1 = DH1;
         DD2 = DH2;
         t1 = randperm(l1);                                                     %Rrandomly selecte training data
         t2 = randperm(l2);
         Tr1 = DD1(t1(1:tt1),:);                                                %The 1st class samples for training
         Tr2 = DD2(t2(1:tt2),:);                                                %The 2ed class samples for training
         DD1(t1(1:tt1),:) = [];
         DD2(t2(1:tt2),:) = [];
         Te1 = DD1;                                                             %The 1st class samples for testing
         Te2 = DD2;                                                             %The 2ed class samples for testing
         TrainData = [Tr1;Tr2];
         TestData = [Te1;Te2];
         nn = size(TestData,1);
         tnn = randperm(nn);
         TestData = TestData(tnn(1,:),:);
%          divfour = ceil(size(TestData,1)*0.05);
%          TestData = TestData(1 :divfour*2+1,:);
%           TestData = TestData(divfour*1+1 :divfour*2+1,:);
%          TestData = TestData(divfour*2+1 :divfour*3+1,:);
%         TestData = TestData(divfour*3+1 :end,:);
         
        %}
         %4--Heart-statlog
         %{
         load Heart-statlog.mat
         C = [One;Two];
         D = normat(C);
         DH1 = D(1:150,:);
         DH2 = D(151:end,:);
         l1 = size(DH1,1);
         l2 = size(DH2,1);
         DH1 = [DH1';ones(1,l1)]';
         DH2 = [DH2';2.*ones(1,l2)]';
         for i_cv = 1 :1
         tt1 = ceil(l1*0.05);                                                        %The number of training samples
         tt2 = ceil(l2*0.05);
         DD1 = DH1;
         DD2 = DH2;
         t1 = randperm(l1);                                                     %Rrandomly selecte training data
         t2 = randperm(l2);
         Tr1 = DD1(t1(1:tt1),:);                                                %The 1st class samples for training
         Tr2 = DD2(t2(1:tt2),:);                                                %The 2ed class samples for training
         DD1(t1(1:tt1),:) = [];
         DD2(t2(1:tt2),:) = [];
         Te1 = DD1;                                                             %The 1st class samples for testing
         Te2 = DD2;                                                             %The 2ed class samples for testing
         TrainData = [Tr1;Tr2];
         TestData = [Te1;Te2];
                  nn = size(TestData,1);
         tnn = randperm(nn);
         TestData = TestData(tnn(1,:),:);
%                   divfour = ceil(size(TestData,1)*0.05);
%          TestData = TestData(1 :divfour*2+1,:);
%            TestData = TestData(divfour*1+1 :divfour*2+1,:);
%           TestData = TestData(divfour*2+1 :divfour*3+1,:);
%         TestData = TestData(divfour*3+1 :end,:);
          %}
         %{
         for i_cv = 1 : 1
         load Ionosphere.mat
         C = [B;G];
         D = normat(C);
         D(isnan(D))=0;
         DH1 = D(1:126,:);
         DH2 = D(127:end,:);
         l1 = size(DH1,1);
         l2 = size(DH2,1);
         DH1 = [DH1';2.*ones(1,l1)]';
         DH2 = [DH2';ones(1,l2)]';
         tt1 = ceil(l1*0.05);                                                        %The number of training samples
         tt2 = ceil(l2*0.05);
         DD1 = DH1;
         DD2 = DH2;
         t1 = randperm(l1);                                                     %Rrandomly selecte training data
         t2 = randperm(l2);
         Tr1 = DD1(t1(1:tt1),:);                                                %The 1st class samples for training
         Tr2 = DD2(t2(1:tt2),:);                                                %The 2ed class samples for training
         DD1(t1(1:tt1),:) = [];
         DD2(t2(1:tt2),:) = [];
         Te1 = DD1;                                                             %The 1st class samples for testing
         Te2 = DD2;                                                             %The 2ed class samples for testing
         TrainData = [Tr1;Tr2];
         TestData = [Te1;Te2];
                           nn = size(TestData,1);
         tnn = randperm(nn);
         TestData = TestData(tnn(1,:),:);
%                   divfour = ceil(size(TestData,1)*0.05);
%           TestData = TestData(1 :divfour*2+1,:);
%             TestData = TestData(divfour*1+1 :divfour*2+1,:);
%            TestData = TestData(divfour*2+1 :divfour*3+1,:);
%         TestData = TestData(divfour*3+1 :end,:);
        %}
          %10--monk1
          %{
          load monk1.mat
          C = [Tr1;Tr2];
          D = normat(C);
          DH1 = D(1:62,:);
          DH2 = D(63:119,:);
          l1 = size(DH1,1);
          l2 = size(DH2,1);
          DH1 = [DH1';ones(1,l1)]';
          DH2 = [DH2';2.*ones(1,l2)]';
          for i_cv = 1 :1
          tt1 = ceil(l1*0.05);                                                        %The number of training samples
         tt2 = ceil(l2*0.05);
         DD1 = DH1;
         DD2 = DH2;
         t1 = randperm(l1);                                                     %Rrandomly selecte training data
         t2 = randperm(l2);
         Tr1 = DD1(t1(1:tt1),:);                                                %The 1st class samples for training
         Tr2 = DD2(t2(1:tt2),:);                                                %The 2ed class samples for training
         DD1(t1(1:tt1),:) = [];
         DD2(t2(1:tt2),:) = [];
         Te1 = DD1;                                                             %The 1st class samples for testing
         Te2 = DD2;                                                             %The 2ed class samples for testing
         TrainData = [Tr1;Tr2];
         TestData = [Te1;Te2];
         nn = size(TestData,1);
         tnn = randperm(nn);
         TestData = TestData(tnn(1,:),:);
          %}
                    %11--monk2
          %{
          load monk2.mat
          C = [Tr1;Tr2];
          D = normat(C);
          DH1 = D(1:105,:);
    DH2 = D(106:169,:);
          l1 = size(DH1,1);
          l2 = size(DH2,1);
          DH1 = [DH1';ones(1,l1)]';
          DH2 = [DH2';2.*ones(1,l2)]';
          for i_cv = 1 :1
          tt1 = ceil(l1*0.05);                                                        %The number of training samples
         tt2 = ceil(l2*0.05);
         DD1 = DH1;
         DD2 = DH2;
         t1 = randperm(l1);                                                     %Rrandomly selecte training data
         t2 = randperm(l2);
         Tr1 = DD1(t1(1:tt1),:);                                                %The 1st class samples for training
         Tr2 = DD2(t2(1:tt2),:);                                                %The 2ed class samples for training
         DD1(t1(1:tt1),:) = [];
         DD2(t2(1:tt2),:) = [];
         Te1 = DD1;                                                             %The 1st class samples for testing
         Te2 = DD2;                                                             %The 2ed class samples for testing
         TrainData = [Tr1;Tr2];
         TestData = [Te1;Te2];
         nn = size(TestData,1);
         tnn = randperm(nn);
         TestData = TestData(tnn(1,:),:);
                    %}
                    %12--monk3
          %{
          load monk3.mat
          C = [Tr1;Tr2];
          D = normat(C);
DH1 = D(1:62,:);
    DH2 = D(63:122,:);
          l1 = size(DH1,1);
          l2 = size(DH2,1);
          DH1 = [DH1';ones(1,l1)]';
          DH2 = [DH2';2.*ones(1,l2)]';
          for i_cv = 1 :1
          tt1 = ceil(l1*0.05);                                                        %The number of training samples
         tt2 = ceil(l2*0.05);
         DD1 = DH1;
         DD2 = DH2;
         t1 = randperm(l1);                                                     %Rrandomly selecte training data
         t2 = randperm(l2);
         Tr1 = DD1(t1(1:tt1),:);                                                %The 1st class samples for training
         Tr2 = DD2(t2(1:tt2),:);                                                %The 2ed class samples for training
         DD1(t1(1:tt1),:) = [];
         DD2(t2(1:tt2),:) = [];
         Te1 = DD1;                                                             %The 1st class samples for testing
         Te2 = DD2;                                                             %The 2ed class samples for testing
         TrainData = [Tr1;Tr2];
         TestData = [Te1;Te2];
         nn = size(TestData,1);
         tnn = randperm(nn);
         TestData = TestData(tnn(1,:),:);
                    %}
          %{
          load Sonar.mat
    C = [R;M];
    D = normat(C);
    DH1 = D(1:97,:);
    DH2 = D(98:end,:);
    l1 = size(DH1,1);
    l2 = size(DH2,1);
    DH1 = [DH1';2.*ones(1,l1)]';                                                    %The lable of 1st class samples
    DH2 = [DH2';ones(1,l2)]';                                                 %The lable of 2ed class samples
    for i_cv = 1 :1
        tt1 = ceil(l1*0.05);                                                        %The number of training samples
         tt2 = ceil(l2*0.05);
         DD1 = DH1;
         DD2 = DH2;
         t1 = randperm(l1);                                                     %Rrandomly selecte training data
         t2 = randperm(l2);
         Tr1 = DD1(t1(1:tt1),:);                                                %The 1st class samples for training
         Tr2 = DD2(t2(1:tt2),:);                                                %The 2ed class samples for training
         DD1(t1(1:tt1),:) = [];
         DD2(t2(1:tt2),:) = [];
         Te1 = DD1;                                                             %The 1st class samples for testing
         Te2 = DD2;                                                             %The 2ed class samples for testing
         TrainData = [Tr1;Tr2];
         TestData = [Te1;Te2];
          nn = size(TestData,1);
         tnn = randperm(nn);
         TestData = TestData(tnn(1,:),:);
          %}
                     %{
          load Spambase.mat
     C = [One;Zero];
    D = normat(C);
    DH1 = D(1:1813,:);
    DH2 = D(1814:end,:);
    l1 = size(DH1,1);
    l2 = size(DH2,1);
    DH1 = [DH1';2.*ones(1,l1)]';                                                    %The lable of 1st class samples
    DH2 = [DH2';ones(1,l2)]';                                                 %The lable of 2ed class samples
    for i_cv = 1 :1
        tt1 = ceil(l1*0.05);                                                        %The number of training samples
         tt2 = ceil(l2*0.05);
         DD1 = DH1;
         DD2 = DH2;
         t1 = randperm(l1);                                                     %Rrandomly selecte training data
         t2 = randperm(l2);
         Tr1 = DD1(t1(1:tt1),:);                                                %The 1st class samples for training
         Tr2 = DD2(t2(1:tt2),:);                                                %The 2ed class samples for training
         DD1(t1(1:tt1),:) = [];
         DD2(t2(1:tt2),:) = [];
         Te1 = DD1;                                                             %The 1st class samples for testing
         Te2 = DD2;                                                             %The 2ed class samples for testing
         TrainData = [Tr1;Tr2];
         TestData = [Te1;Te2];
          nn = size(TestData,1);
         tnn = randperm(nn);
         TestData = TestData(tnn(1,:),:);
                    %}
                    %
                    load kr-vs-kp.mat
    C = [win;nowin];
    D = normat(C);
    DH1 = D(1:1669,:);
    DH2 = D(1670:end,:);
    l1 = size(DH1,1);
    l2 = size(DH2,1);
    DH1 = [DH1';ones(1,l1)]';                                                    %The lable of 1st class samples
    DH2 = [DH2';2.*ones(1,l2)]';                                                 %The lable of 2ed class samples
    for i_cv = 1 :1
        tt1 = ceil(l1*0.05);                                                        %The number of training samples
         tt2 = ceil(l2*0.05);
         DD1 = DH1;
         DD2 = DH2;
         t1 = randperm(l1);                                                     %Rrandomly selecte training data
         t2 = randperm(l2);
         Tr1 = DD1(t1(1:tt1),:);                                                %The 1st class samples for training
         Tr2 = DD2(t2(1:tt2),:);                                                %The 2ed class samples for training
         DD1(t1(1:tt1),:) = [];
         DD2(t2(1:tt2),:) = [];
         Te1 = DD1;                                                             %The 1st class samples for testing
         Te2 = DD2;                                                             %The 2ed class samples for testing
         TrainData = [Tr1;Tr2];
         TestData = [Te1;Te2];
          nn = size(TestData,1);
         tnn = randperm(nn);
         TestData = TestData(tnn(1,:),:);
         %}
%         load([dataset_name,'.mat']);
%         file_name = eval([dataset_name,'{',num2str(index(i_index)),',1}']);
%         dataname =  strcat('SUNDO_SVM_',file_name);
%         final_res = zeros(ktimes+2,5);
%         
%         for i_cv = 1:ktimes
%             
%             if strcmp(dataset_name,'KEEL')
%                 train_all = eval([dataset_name,'{',num2str(index(i_index)),',3}{',num2str(i_cv),',1}']);
%                 test_all = eval([dataset_name,'{',num2str(index(i_index)),',3}{',num2str(i_cv),',2}']);
%                 train_all(:,end) = train_all(:,end)+1;
%                 test_all(:,end) = test_all(:,end)+1;
%             else
%                 train_all = eval([dataset_name,'{',num2str(index(i_index)),',2}{',num2str(i_cv),',1}']);
%                 test_all = eval([dataset_name,'{',num2str(index(i_index)),',2}{',num2str(i_cv),',2}']);
%             end
%             
             train=TrainData(:,1:end-1);train_labels=TrainData(:,end)-1;
             test=TestData(:,1:end-1);test_labels=TestData(:,end)-1;
%             
            %%%%%%
            
            Train=train;
            Train_labels=train_labels;
            
            %%%%%% Specifying the majority and minority classes and initial IR %%%%%%
            
            index_majority=find(Train_labels==0);
            class_majority=Train(index_majority,:);
            
            index_minority=find(Train_labels==1);
            class_minority=Train(index_minority,:);
            
            IR_initial(i_index,i_cv)=(length(index_majority)./length(index_minority));
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% oversampling process %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            T1=ceil((length(index_majority))/2);
            counter=length(index_minority);
            
            if (counter<T1)
                
                K1=sqrt(size(class_minority,1));
                K1=ceil(K1);
                
                %%%%%% Finding the initial centers of clusters for oversampling %%%%%%
                
                dist_c1=[];
                
                X1=class_minority;
                
                N1=size(X1,1);
                
                Average=mean(X1);
                
                for c1=1:size(X1,1)
                    
                    dist_c1(c1)=sqrt(sum((X1(c1,:)-Average).^2));
                    
                end
                
                [~,IND_c1]=sort(dist_c1);
                
                XX1=X1(IND_c1,:);
                
                XX1=flipud(XX1);
                
                Icenter=XX1(1,:);
                
                for c2=2:K1
                    
                    IND_c2=(1+((c2-1)*(fix(N1/K1))));
                    
                    Icenter=vertcat(XX1(IND_c2,:),Icenter);
                    
                end
                
                matrix=Icenter;
                
                %%%%%% Clustering the minority class %%%%%%
                
                [IDX, C]=kmeans(X1,K1,...
                    'emptyaction','singleton','start',matrix);
                
                s1=1;
                
                for c1=1:K1
                    
                    Density=[];
                    
                    index_cluster=find(IDX==c1);
                    
                    if (isempty(index_cluster)~=1)
                        
                        Cluster=X1(index_cluster,:);
                        Cluster(:,(size(Cluster,2)+1))=index_cluster;
                        
                        %%%%%% Calculating the density of minority samples %%%%%%
                        
                        training_set=Cluster;
                        Density(1:size(training_set,1))=0;
                        Density=Density';
                        for i=1:size(training_set,1)
                            Dist=[];
                            for j=1:size(training_set,1)
                                if (i==j)
                                    Dist(j)=inf;
                                else
                                    Dist(j)=(sum((training_set(i,1:end-1)-training_set(j,1:end-1)).^2))^0.5;
                                end
                            end
                            [~,Ind]=min(Dist);
                            Density(Ind)=Density(Ind)+1;
                        end
                        
                        %%%%%%
                        
                        if (s1==1)
                            
                            Density_final_minor=Density;
                            
                            Index_final_minor=index_cluster;
                            
                            s1=s1+1;
                            
                        else
                            
                            Density_final_minor=vertcat(Density_final_minor,Density);
                            
                            Index_final_minor=vertcat(Index_final_minor,index_cluster);
                            
                            s1=s1+1;
                            
                        end
                        
                    else
                        
                        continue;
                        
                    end
                    
                end
                
                %%%%%% Calculating probability of selection and CDF for the minority class %%%%%%
                
                Cdf_minor=[];
                
                Selection_probability_minor=(Density_final_minor./(sum(Density_final_minor)));
                Cdf_minor(1)=Selection_probability_minor(1);
                
                for c1=2:length(Density_final_minor)
                    
                    Cdf_minor(c1)=Cdf_minor(c1-1)+Selection_probability_minor(c1);
                    
                end
                
                %%%%%%
                
                k=ceil(sqrt(size(class_minority,1)));
                
                while (counter~=T1)
                    
                    %%%%%% Applying the roulette wheel operator for oversampling %%%%%%
                    
                    q1=rand;
                    
                    for c2=1:length(Density_final_minor)
                        
                        if (q1<=Cdf_minor(c2))
                            minor_selected=class_minority(Index_final_minor(c2),:);
                            break;
                        end
                        
                    end
                    
                    %%%%%% Finding k nearest neighbors and generating the new samples for the minority class %%%%%%
                    
                    dist=[];
                    for i=1:size(class_minority,1)
                        
                        dist(i)=(sum((minor_selected-class_minority(i,:)).^2))^0.5;
                        
                    end
                    
                    index_zero=find(dist==0);
                    dist(index_zero)=1000;
                    
                    [dist_sorted,ind2]=sort(dist);
                    sample_nearest_neghbors=class_minority(ind2(1:k),:);
                    index2=randi(k);
                    
                    nearest_neighbor_selected=sample_nearest_neghbors(index2,:);
                    
                    data_synthetic=minor_selected+((minor_selected- nearest_neighbor_selected)*rand);
                    
                    %%%%%%
                    
                    Train(end+1,:)=data_synthetic;
                    Train_labels(end+1)=1;
                    Train_all=horzcat(Train,Train_labels);
                    
                    counter=counter+1;
                    
                end
                
                index_minority=find(Train_labels==1);
                class_minority=Train(index_minority,:);
                
                IR_over(i_index,i_cv)=(length(index_majority)./length(index_minority));
                
            end
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% undersampling process %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            K2=sqrt(size(class_majority,1));
            K2=ceil(K2);
            
            %%%%%% Finding the initial centers of clusters for undersampling %%%%%%
            
            dist_c1=[];
            
            X2=class_majority;
            
            N2=size(X2,1);
            
            Average=mean(X2);
            
            for c1=1:size(X2,1)
                
                dist_c1(c1)=sqrt(sum((X2(c1,:)-Average).^2));
                
            end
            
            [Dist_c1,IND_c1]=sort(dist_c1);
            
            XX2=X2(IND_c1,:);
            
            XX2=flipud(XX2);
            
            Icenter=XX2(1,:);
            
            for c2=2:K2
                
                IND_c2=(1+((c2-1)*(fix(N2/K2))));
                
                Icenter=vertcat(XX2(IND_c2,:),Icenter);
                
            end
            
            matrix=Icenter;
            
            %%%%%% Clustering the majority class %%%%%%
            
            [IDX, C]=kmeans(X2,K2,...
                'emptyaction','singleton','start',matrix);
            
            p1=1;
            
            for c1=1:K2
                
                Density=[];
                
                index_cluster=find(IDX==c1);
                
                if (isempty(index_cluster)~=1)
                    
                    Cluster=class_majority(index_cluster,:);
                    Cluster(:,(size(Cluster,2)+1))=index_cluster;
                    
                    %%%%%% Calculating the density of majority samples %%%%%%
                    
                    training_set=Cluster;
                    Density(1:size(training_set,1))=0;
                    Density=Density';
                    for i=1:size(training_set,1)
                        Dist=[];
                        for j=1:size(training_set,1)
                            if (i==j)
                                Dist(j)=inf;
                            else
                                Dist(j)=(sum((training_set(i,1:end-1)-training_set(j,1:end-1)).^2))^0.5;
                            end
                        end
                        [~,Ind]=min(Dist);
                        Density(Ind)=Density(Ind)+1;
                    end
                    
                    %%%%%%
                    
                    if (p1==1)
                        
                        Density_final_major=Density;
                        
                        Index_final_major=index_cluster;
                        
                        p1=p1+1;
                        
                    else
                        
                        Density_final_major=vertcat(Density_final_major,Density);
                        
                        Index_final_major=vertcat(Index_final_major,index_cluster);
                        
                        p1=p1+1;
                        
                    end
                    
                else
                    
                    continue;
                    
                end
                
            end
            
            %%%%%% Calculating probability of selection and CDF for the majority class %%%%%%
            
            Cdf_major=[];
            
            Selection_probability_major=(Density_final_major./(sum(Density_final_major)));
            Cdf_major(1)=Selection_probability_major(1);
            
            for c3=2:length(Density_final_major)
                
                Cdf_major(c3)=Cdf_major(c3-1)+Selection_probability_major(c3);
                
            end
            
            Cdf_major(2,:)=0;
            
            %%%%%%
            
            indexes_selected=[];
            r=1;
            T2=(size(class_minority,1));
            counter=0;
            
            %%%%%% Applying the roulette wheel operator for undersampling %%%%%%
            
            while (counter~=T2)
                
                q2=rand;
                
                for c4=1:length(Density_final_major)
                    
                    if (q2<=Cdf_major(1,c4))
                        
                        if (Cdf_major(2,c4)==0)
                            
                            indexes_selected(r)=Index_final_major(c4);
                            Cdf_major(2,c4)=1;
                            r=r+1;
                            counter=counter+1;
                            
                            break;
                            
                        end
                        
                    end
                    
                end
                
            end
            
            %%%%%% Forming the balanced training set %%%%%%
            
            indexes_selected=(indexes_selected(:))';
            indexs_selected_majority=index_majority(indexes_selected);
            Class_majority=class_majority(indexes_selected,:);
            Class_minority=class_minority;
            Train_balanced=vertcat(Class_majority,Class_minority);
            labels_Class_majority=Train_labels(indexs_selected_majority);
            labels_Class_minority=Train_labels(index_minority);
            Train_labels_balanced=vertcat(labels_Class_majority,labels_Class_minority);
            
            %%%%% Computing the oversampling rate %%%%%
            
            R1=size(train,1);
            R2=size(Train_balanced,1);
            Diff=(R2-R1);
            rate_over_cv(i_index,i_cv)=(Diff/R1)*100;
            
            %%%%%% Computing the increase rate of number of support vectors %%%%%%
            
            svmStruct1=fitcsvm(train,train_labels,'KernelFunction','rbf');
            S1=svmStruct1.SupportVectors;
            
            svmStruct2=fitcsvm(Train_balanced,Train_labels_balanced,'KernelFunction','rbf');
            S2=svmStruct2.SupportVectors;
            
            S1_size=size(S1,1);
            S2_size=size(S2,1);
            
            rate_supportvectors_cv(i_index,i_cv)=((S2_size-S1_size)/S1_size);
            
            %%%%%% Computing the increase and decrease rates in the majority and minority classes and final IR %%%%%%
            
            %%%%%% Decrease reate of majority class %%%%%%
            
            D1=length(find(Train_labels_balanced==0));
            D2=length(find(train_labels==0));
            rate_decrease_cv(i_index,i_cv)=((D2-D1)/D2);
            
            %%%%%% Increase rate of minority class %%%%%%
            
            I1=length(find(Train_labels_balanced==1));
            I2=length(find(train_labels==1));
            rate_increase_cv(i_index,i_cv)=((I1-I2)/I2);
            
            %%%%%% Calculating updated IR %%%%%%
            
            index_majority=find(Train_labels_balanced==0);
            index_minority=find(Train_labels_balanced==1);
            
            IR_updated_cv(i_index,i_cv)=(length(index_majority)./length(index_minority));
            
            %%%%%%
            
            %%%%%% Evaluating the performance of classifier %%%%%%
            
            svmStruct = fitcsvm(Train_balanced,Train_labels_balanced,'KernelFunction','rbf');
            label_svm = predict(svmStruct,test);
            
            conmat=confusionmat(test_labels,label_svm);
            
            Accuracy=(conmat(2,2)+conmat(1,1))./(conmat(2,2)+conmat(2,1)+conmat(1,2)+conmat(1,1));
            Precision=(conmat(2,2))./(conmat(2,2)+conmat(1,2));
            Recall=(conmat(2,2))./(conmat(2,2)+conmat(2,1));
            
            F_measure=2*((Precision*Recall)./(Precision+Recall));
            F_measure_cv(i_index,i_cv)=F_measure;
            Acc_p(i_index,i_cv)=Accuracy;
            
            [X,Y,T,AUC] = perfcurve(test_labels,label_svm,1);
            AUC_cv(i_index,i_cv)=AUC;
            
            %%%%%%
            
        end
        
        F_measure_cv(isnan(F_measure_cv))=0;
        Acc_avg(i_avg)=mean(Acc_p(i_index,:));
        AUC_avg(i_avg)=mean(AUC_cv(i_index,:));
        F_measure_avg(i_avg)=mean(F_measure_cv(i_index,:));
        Rate_over_avg(i_avg)=mean(rate_over_cv(i_index,:));
        Rate_supportvectors_avg(i_avg)=mean(rate_supportvectors_cv(i_index,:));
        Rate_decrease_avg(i_avg)=mean(rate_decrease_cv(i_index,:));
        Rate_increase_avg(i_avg)=mean(rate_increase_cv(i_index,:));
        IR_updated_avg(i_avg)=mean(IR_updated_cv(i_index,:));
        
    end
    
    AUC_final=mean(AUC_avg);
    ACC_final=mean(Acc_avg)
    acc_st=std(Acc_avg',0,1)
    F_measure_final=mean(F_measure_avg);
    Rate_over_final=mean(Rate_over_avg);
    Rate_supportvectors_final=mean(Rate_supportvectors_avg);
    Rate_decrease_final=mean(Rate_decrease_avg);
    Rate_increase_final=mean(Rate_increase_avg);
    IR_updated_final=mean(IR_updated_avg);
    
    %%%%%% Results %%%%%%
    
    %Dataset_Results=sprintf('dataset_name is: %s and its results are as: AUC= %f, F_measure= %f, Rate_oversampling= %f, Rate_supportvectors= %f, Rate_decrease= %f, Rate_increase= %f, IR_updated= %f\n',dataname,AUC_final,F_measure_final,Rate_over_final,Rate_supportvectors_final,Rate_decrease_final,Rate_increase_final,IR_updated_final)
    
    %%%%%%
    
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