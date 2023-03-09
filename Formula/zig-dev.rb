class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e84f4cdd3b942858b7e50891edad4b18fb818a154b91c27fca507b1063e4c99b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4955c8d75316a146f9fbee9d537dc2ae683740e2b51750df038b824b58ac157a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d3cf3334e50de0e3e2e05ca0b912a4ca212db4e0cb6d7d39e175345cffe2baf7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1907+ecc0108ce.tar.xz"
  version "0.11.0-dev.1907+ecc0108ce"
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
