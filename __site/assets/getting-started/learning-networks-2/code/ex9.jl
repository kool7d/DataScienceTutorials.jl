# This file was generated, do not modify it. # hide
mutable struct CompositeModel2 <: DeterministicNetwork
    std_model::Standardizer
    box_model::UnivariateBoxCoxTransformer
    ridge_model::RidgeRegressor
end

function MLJ.fit(m::CompositeModel2, verbosity::Int, X, y)
    Xs = source(X)
    ys = source(y)
    W = MLJ.transform(machine(m.std_model, Xs), Xs)
    box = machine(m.box_model, ys)
    z = MLJ.transform(box, ys)
    ẑ = predict(machine(m.ridge_model, W, z), W)
    ŷ = inverse_transform(box, ẑ)
    mach = machine(Deterministic(), Xs, ys; predict=ŷ)
    fit!(mach, verbosity=verbosity - 1)
    return mach()
end

mdl = CompositeModel2(Standardizer(), UnivariateBoxCoxTransformer(),
                      RidgeRegressor(lambda=0.1))
cm = machine(mdl, X, y)
res = evaluate!(cm, resampling=Holdout(fraction_train=0.8), measure=rms)
round(res.measurement[1], sigdigits=3)