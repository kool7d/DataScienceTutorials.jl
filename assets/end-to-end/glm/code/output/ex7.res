(standardizer = (mean_and_std_given_feature = Dict(:V1 => (0.0024456300706479973, 1.1309193246154066),:V2 => (-0.015561621122145304, 1.1238897897565245),:V5 => (0.0077036209704558975, 1.1421493464876622),:V3 => (0.02442889884313839, 2.332713568319154),:V4 => (0.15168404285157286, 6.806065861835239)),),
 one_hot_encoder = (fitresult = OneHotEncoderResult @676,),
 linear_regressor = (coef = [1.0207869497405524, 1.03242891546997, 0.009406292423317668, 0.026633915171207462, 0.29985915636370225],
                     intercept = 0.015893883995789806,),
 machines = Machine[Machine{Standardizer} @801, Machine{OneHotEncoder} @227, Machine{LinearRegressor} @459],
 fitted_params_given_machine = OrderedCollections.LittleDict{Any,Any,Array{Any,1},Array{Any,1}}(Machine{Standardizer} @801 => (mean_and_std_given_feature = Dict(:V1 => (0.0024456300706479973, 1.1309193246154066),:V2 => (-0.015561621122145304, 1.1238897897565245),:V5 => (0.0077036209704558975, 1.1421493464876622),:V3 => (0.02442889884313839, 2.332713568319154),:V4 => (0.15168404285157286, 6.806065861835239)),),Machine{OneHotEncoder} @227 => (fitresult = OneHotEncoderResult @676,),Machine{LinearRegressor} @459 => (coef = [1.0207869497405524, 1.03242891546997, 0.009406292423317668, 0.026633915171207462, 0.29985915636370225], intercept = 0.015893883995789806)),)