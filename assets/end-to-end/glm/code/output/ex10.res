(standardizer = (mean_and_std_given_feature = Dict(:wage => (9.500506478338009, 1.3430670761078416),:unemp => (7.597214581091511, 2.763580873344848),:tuition => (0.8146082493518824, 0.33950381985971717),:score => (50.88902933684601, 8.701909614072397)),),
 one_hot_encoder = (fitresult = OneHotEncoderResult @441,),
 linear_binary_classifier = Any[],
 machines = Machine[Machine{Standardizer} @169, Machine{OneHotEncoder} @402, Machine{LinearBinaryClassifier{LogitLink}} @499],
 fitted_params_given_machine = OrderedCollections.LittleDict{Any,Any,Array{Any,1},Array{Any,1}}(Machine{Standardizer} @169 => (mean_and_std_given_feature = Dict(:wage => (9.500506478338009, 1.3430670761078416),:unemp => (7.597214581091511, 2.763580873344848),:tuition => (0.8146082493518824, 0.33950381985971717),:score => (50.88902933684601, 8.701909614072397)),),Machine{OneHotEncoder} @402 => (fitresult = OneHotEncoderResult @441,),Machine{LinearBinaryClassifier{LogitLink}} @499 => (coef = [0.2025072937886873, 0.1307529391091288, 0.34495162493983483, 0.9977565847160845, -0.5022315102984596, -0.4785005626021655, -0.20440507809955027, -0.06922751403500114, 0.058928649730170986, -0.0834474982820323, -0.002315143333859671, 0.46177653955786546, 0.3843262958100772], intercept = -1.076633890579364)),)