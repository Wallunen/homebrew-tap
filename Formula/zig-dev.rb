class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "84dcd0644d1575209e787acb66f7560a2a5296c8c0b92732774d1c185bdf3fcf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e84616dd7ba9d1c195a8acced1557a7e61cfee7bd366b0441b3c1d5b2dedf252" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "24d18e457ff35b6809b9e16c978b2977e6c855dd87f9234ae2bba9a80e3d884b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.389+61b70778b.tar.xz"
  version "0.12.0-dev.389+61b70778b"
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
