class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8d27c61c36454ecffe56ae00055f8354289464c1ea507182cccab585ad31d115" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5edd4f9e88eb6864f1818ecf81d2d489cb10845a4e84e6ebcee06566b205e769" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3607099807dca909935fb9249c16f4bfed6e58872ec1a7fc1eb65776d6d32111" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1298+da06269d7.tar.xz"
  version "0.12.0-dev.1298+da06269d7"
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
