class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e9b4de9e88692991603d2f77672fefcf9d3d7ded63ff8baf09767a1d51a95411" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "54064d7240d322f17e9e9aca3c5cc5ab738cf44640063ff2f6d0e79257f423bf" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "daba11ac10a76214c976ce5af60bdc44b17139bbeea72de6f482f35720e48a19" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1388+d89266569.tar.xz"
  version "0.12.0-dev.1388+d89266569"
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
