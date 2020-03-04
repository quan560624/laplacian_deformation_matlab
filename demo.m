clc;
clear all;
close all;
file_name = "./objs/test_in.obj";
[vertex,faces, N] = load_obj(file_name); 
Mean_vertex = mean(vertex); % must normalize the vertex
vertex = vertex-Mean_vertex;
BI = [881  882  904  905  906  922 1209 1211 1213 1218 1219 1223 1224 1225 1226 1227 1228 1229 1299 1300 1327 1342 1569 1571 1572 1573 1741 1742 1743 1744 1754 1757 1758 1778 1779 1780 1789 1790 1791 1792 1929 2061 2125 2257 2258 2260 2261 2263 2269 2278 2279 2344 2387 2436 2496 2527 2529 2531 2577 3750 3751 3764 3768 3769 3770 3771 3772 3773 3774 3788 3789 3790 3970 4038 4074 4075 4077 4078 4079 4080 4084 4085 4086 4087 4088 4089 4090 4159 4160 4161 4162 4188 4189 4428 4430 4431 4432 4599 4602 4613 4615 4636 4637 4648 4649 4650 4651 4652 4789 4921 4985 5117 5119 5120 5122 5124 5125 5128 5137 5138 5202 5244 5293];  % boundary obj index
BI = BI + 1;
BC = vertex(BI, :);
ind = find(BI==2528);
tmp = BC(ind, :)
tmp(3) = tmp(3) * 1.2; % simulate the point to move, the rest points are fixed
BC(ind, :) = tmp;
U=laplacian_surface_editing_3D(vertex-mean(vertex),faces,BI,BC);
write_obj_file(U+Mean_vertex, faces, N, "output.obj");