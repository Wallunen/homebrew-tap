class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "dfbc39855dac8fb95c71e439cb455240a21135619483f480ff62494ab0d9f248" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "66856ebe56ac12f4fa9524836c6b02127045585c39e5df481212346389427b8f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bfa7091a9855422fd05a4f782d9594550030b4cd4be46dfac62cfd0e4b4e8ad3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.589+731fd217d.tar.xz"
  version "0.12.0-dev.589+731fd217d"
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
