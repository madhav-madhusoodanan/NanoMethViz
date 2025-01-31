test_that("Plotting region works", {
    # setup
    nmr <- load_example_nanomethresult()

    # test
    expect_silent(p <- plot_region(nmr, "chr7", 6703892, 6730431))
    expect_true(is(p, "ggplot"))

    params <- expand.grid(
        heatmap = c(TRUE, FALSE),
        spaghetti = c(TRUE, FALSE),
        gene_anno = c(TRUE, FALSE)
    )

    for (i in 1:nrow(params)) {
        expect_silent(
            plot_region(
                nmr, "chr7", 6703892, 6730431,
                heatmap = params$heatmap[i],
                spaghetti = params$spaghetti[i]
            )
        )
    }
})
