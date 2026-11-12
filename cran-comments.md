## Resubmission comments

This is a resubmission addressing the following issue raised by CRAN (Uwe Ligges):

* "Found the following (possibly) invalid file URI: URI: LICENSE From: README.md"
  -> Updated the license link in `README.md` to point to the full web URL `<https://www.apache.org/licenses/LICENSE-2.0>` instead of the relative file link `LICENSE`, which was excluded from the built tarball via `.Rbuildignore`.

## Test environments

* Local Linux Mint Debian Edition 7 (x86_64-pc-linux-gnu), R 4.6.2
* win-builder (devel)
* R-hub (linux, macos-arm64, windows)

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.
