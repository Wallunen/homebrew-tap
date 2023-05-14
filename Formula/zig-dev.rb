class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "618e3a35a0869f2d0ec8514aac8ff2895a05dc03033f680ca8409801e5d99f00" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0e914fccaabd00d7320406eff6f57647fd4a106db6af0757fda486afe8268055" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "70876381927b4781a51f5b4398febfd18a85c716cc6b60adbbaf79f82bcc7ea8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3107+6547d2331.tar.xz"
  version "0.11.0-dev.3107+6547d2331"
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
