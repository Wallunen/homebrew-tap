class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260810-164810"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "efd1a398c4515be17b34a68ade81ab49ab0ffdd8035af2733c1051870efe0a9e"
    sha256 cellar: :any_skip_relocation, sequoia:      "d615430801dea88209fa8f95640a21d245061fda2646599f90b8fb204a8ea4d1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fb06cbe3abe09e8aac3754b51310b69098256435e48a1ef249c47eae65146d54"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a1f50266a2bc2099017e09f9703d0c2241e44145e11cbd19e3701c60ea7f8f0b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e7be04b0bf425cdaf3f0f400140ae297f242b6c50d3936cb7d4ea3e6016b2484" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3b4059dd830aafd2978c47f92adf14094ff2e5cfe2ab79b47b8e52ccc76e2135" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1676+c9dc9b798.tar.xz"
  version "0.17.0-dev.1676+c9dc9b798"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
