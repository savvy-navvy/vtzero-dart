// Relative include so we reuse the shared C++ sources under src/.
// CocoaPods and SPM both compile this forwarder; neither can list files
// outside the macos/ package tree directly.
#include "../../../../src/vtzero_wrapper.cpp"
