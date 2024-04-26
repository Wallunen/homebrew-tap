class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d8fb090bd69d7e191a3443520da5c52da430fbffc0de12ac87a114a6cc1f20ca" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "37784926f45e5aba87f72f19de704adcb30604871df0c3ef6c0d177ae84bb741" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "746e1102a6452722d382252cc6aed8728c7389ea16431bf5bc5ba0adc0f7e524" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.46+3648d7df1.tar.xz"
  version "0.13.0-dev.46+3648d7df1"
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
