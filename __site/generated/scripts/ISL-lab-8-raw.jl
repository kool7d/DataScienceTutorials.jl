# Before running this, please make sure to activate and instantiate the environment
# corresponding to [this `Project.toml`](https://raw.githubusercontent.com/alan-turing-institute/DataScienceTutorials.jl/master/Project.toml) and [this `Manifest.toml`](https://raw.githubusercontent.com/alan-turing-institute/DataScienceTutorials.jl/master/Manifest.toml)
# so that you get an environment which matches the one used to generate the tutorials:
#
# ```julia
# cd("DataScienceTutorials") # cd to folder with the *.toml
# using Pkg; Pkg.activate("."); Pkg.instantiate()
# ```

using MLJ
import RDatasets: dataset
using PrettyPrinting
import DataFrames: DataFrame, select, Not

@load DecisionTreeClassifier pkg=DecisionTree

carseats = dataset("ISLR", "Carseats")

first(carseats, 3) |> pretty

High = ifelse.(carseats.Sales .<= 8, "No", "Yes") |> categorical;
carseats[!, :High] = High;

X = select(carseats, Not([:Sales, :High]))
y = carseats.High;

HotTreeClf = @pipeline(OneHotEncoder(),
                       DecisionTreeClassifier())

mdl = HotTreeClf
mach = machine(mdl, X, y)
fit!(mach);

ypred = predict_mode(mach, X)
misclassification_rate(ypred, y)

train, test = partition(eachindex(y), 0.5, shuffle=true, rng=333)
fit!(mach, rows=train)
ypred = predict_mode(mach, rows=test)
misclassification_rate(ypred, y[test])

r_mpi = range(mdl, :(decision_tree_classifier.max_depth), lower=1, upper=10)
r_msl = range(mdl, :(decision_tree_classifier.min_samples_leaf), lower=1, upper=50)

tm = TunedModel(model=mdl, ranges=[r_mpi, r_msl], tuning=Grid(resolution=8),
                resampling=CV(nfolds=5, rng=112),
                operation=predict_mode, measure=misclassification_rate)
mtm = machine(tm, X, y)
fit!(mtm, rows=train)

ypred = predict_mode(mtm, rows=test)
misclassification_rate(ypred, y[test])

fitted_params(mtm).best_model.decision_tree_classifier

@load DecisionTreeRegressor pkg=DecisionTree

boston = dataset("MASS", "Boston")

y, X = unpack(boston, ==(:MedV), col -> true)

train, test = partition(eachindex(y), 0.5, shuffle=true, rng=551);

scitype(X)

X = coerce(X, autotype(X, rules=(:discrete_to_continuous,)))

dtr_model = DecisionTreeRegressor()
dtr = machine(dtr_model, X, y)

fit!(dtr, rows=train)

ypred = predict(dtr, rows=test)
round(rms(ypred, y[test]), sigdigits=3)

r_depth = range(dtr_model, :max_depth, lower=2, upper=20)

tm = TunedModel(model=dtr_model, ranges=[r_depth], tuning=Grid(resolution=10),
                resampling=CV(nfolds=5, rng=1254), measure=rms)
mtm = machine(tm, X, y)

fit!(mtm, rows=train)

ypred = predict(mtm, rows=test)
round(rms(ypred, y[test]), sigdigits=3)

@load RandomForestRegressor pkg=ScikitLearn

rf_mdl = RandomForestRegressor()
rf = machine(rf_mdl, X, y)
fit!(rf, rows=train)

ypred = predict(rf, rows=test)
round(rms(ypred, y[test]), sigdigits=3)

@load XGBoostRegressor

xgb_mdl = XGBoostRegressor(num_round=10, max_depth=10)
xgb = machine(xgb_mdl, X, y)
fit!(xgb, rows=train)

ypred = predict(xgb, rows=test)
round(rms(ypred, y[test]), sigdigits=3)

# This file was generated using Literate.jl, https://github.com/fredrikekre/Literate.jl

