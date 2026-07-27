import Lake
open Lake DSL

package FiniteElementConvergenceCanonicalLaneLean where
  version := v!"0.1.0"

require canonical_lane_mathlib_core from git
  "https://github.com/HautevilleHouse/canonical-lane-mathlib.git" @
  "ac2caf2b7698cd96d2cd0bf5a4cdbbe88c7f620f"

lean_lib FiniteElementConvergenceCanonicalLaneLean where
