data = importdata('docword.nips.txt');
fulldata = spconvert(data);
c = full(fulldata);

%cosine similarity matrix

for a = 1:1500
    for b = a:1500
      if a == b
      ans(a,b) = 0;
      else
      ans(a,b)= dot(c(a,:),c(b,:))/(norm(c(a,:),2)*norm(c(b,:),2));
      ans(b,a)= ans(a,b); 
      end
    end
end

clustering_matrix = eye(1500)
count = 0;
for j = 1:3
    resultant_matrix = clustering_matrix*ans
    [M,I] = max(resultant_matrix,[],2);
    clustering_matrix = zeros(1500);
    for k = 1: 1500
    clustering_matrix(k,I(k,1)) = 1;
    end
end
for m = 1:1500
freq(m,1) = sum( clustering_matrix(:,m) == 1);
end
for m = 1:1500
if  freq(m,1) ~= 0
count = count + 1;
end
end

%top five neighbours

[sortvals, sortidx] = sort(ans,2,'descend'); 
B = zeros(size(ans),class(ans)); 
for K = 1 : size(ans,1) 
B(K,sortidx(K,1:5)) = sortvals(K,1:5); 
end

clustering_matrix = eye(1500)
count5 = 0;
for j = 1:3
    resultant_matrix = clustering_matrix*B;
    [M,I] = max(resultant_matrix,[],2);
    clustering_matrix = zeros(1500);
    for k = 1: 1500
    clustering_matrix(k,I(k,1)) = 1;
    end
end
for m = 1:1500
freq(m,1) = sum( clustering_matrix(:,m) == 1);
end
for m = 1:1500
if  freq(m,1) ~= 0
count5 = count5 + 1;
end
end

%top 10 neighbours

[sortvals, sortidx] = sort(ans,2,'descend'); 
B = zeros(size(ans),class(ans)); 
for K = 1 : size(ans,1) 
B(K,sortidx(K,1:10)) = sortvals(K,1:10); 
end

clustering_matrix = eye(1500)
count10 = 0;
for j = 1:3
    resultant_matrix = clustering_matrix*B;
    [M,I] = max(resultant_matrix,[],2);
    clustering_matrix = zeros(1500);
    for k = 1: 1500
    clustering_matrix(k,I(k,1)) = 1;
    end
end
for m = 1:1500
freq(m,1) = sum( clustering_matrix(:,m) == 1);
end
for m = 1:1500
if  freq(m,1) ~= 0
count10 = count10 + 1;
end
end

