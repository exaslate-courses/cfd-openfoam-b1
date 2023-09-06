clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Variables.

v_num = 1;
v_str = 'openfoam';

% Display variable.
disp(v_str);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1D array.

v_arr_1d_row_wise = [1 2 3];
v_arr_1d_col_wise = [1; 2; 3];
disp(v_arr_1d_row_wise);
disp(v_arr_1d_col_wise);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2D (matrices)

v_mat_sqr = [1 2 3; 4 5 6; 7 8 9]
v_mat_rec = [1 2 3; 4 5 6]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Range

v_range_1d = [0:1:10]
v_range_1d_col = v_range_1d';
% disp(v_range_1d_col)

% v_range_1d_col_element_wise_sqr = v_range_1d_col.^2;
% length(v_range_1d_col_element_wise_sqr)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Access elements from array.
% v_range_1d_col_element_wise_sqr(3,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% For loop.

% v_range_1d_col

disp('-------- for loop ----------');
for i = 1 : length(v_range_1d_col)
  fprintf('Value at %d is: %d\n', i, v_range_1d_col(i, 1));
end
