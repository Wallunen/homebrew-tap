class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "48df75b34d3571f05e0c17b461b14927d2ce35b3a7aad2fe67364535da16743d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6861c5b198712758da70e26132e4a13984233598d7b30409005c55284bc8531e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5b8100b7c4462eddd9e3ee1df620435c9dd20a8e8f68ee469d569c1a15b8a4f5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3161+377ecc6af.tar.xz"
  version "0.12.0-dev.3161+377ecc6af"
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
