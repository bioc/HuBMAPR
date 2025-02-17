test_that("'samples()' works", {
  test_samples <- samples()
  expect_true(tibble::is_tibble(test_samples))
  expect_true(nrow(test_samples) > 0L)
  expect_true(all(names(test_samples) %in% samples_default_columns("character")))
})

test_that("'sample_detail()' work for specific sample", {
  test_uuid <- "038e4fcefc00f7ecc537b5d8462e6404"
  test_sample <- sample_detail(test_uuid)
  expect_true(tibble::is_tibble(test_sample))
  expect_true(nrow(test_sample) == 1L && ncol(test_sample) >= 1L)
})

test_that("'samples_default_columns()' works", {

  ## testing tibble output
  tbl <- samples_default_columns()
  expect_true(tibble::is_tibble(tbl))
  expect_true(nrow(tbl) > 0L && all("columns" %in% names(tbl)))
})

test_that("'sample_derived()' works", {

  # sample with no derived
  test_uuid <- "1e69e0533d19740b03f1a6c3703c4435"
  test_sample <- sample_derived(test_uuid, "Sample")
  expect_true(is.null(test_sample))

  # sample with 2 derived samples
  test_uuid <- "d8b4d1bcc39e7b2ebd16ec206e103ee7"
  test_sample_2 <- sample_derived(test_uuid, "Sample")
  expect_true(tibble::is_tibble(test_sample_2))

  # sample with 1 derived datasets
  test_uuid <- "cb04b5699eeb6e5ce89d41f317b74181"
  test_sample_3 <- sample_derived(test_uuid, "Dataset")
  expect_true(tibble::is_tibble(test_sample_2))
  expect_true(nrow(test_sample_2) > 0L)
})

test_that("'sample_metadata()' works", {
  
  test_uuid <- "681f7f1d0a87427cf182f231a01ca6f0"
  tbl <- sample_metadata(test_uuid)
  expect_true(tibble::is_tibble(tbl))
  expect_true(nrow(tbl) > 0L &&
                all(c("Key", "Value") %in% names(tbl)))
  
})
