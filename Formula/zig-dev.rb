class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0b98f70c819bade1d388a8dd1ab77ab4a3427b47a01aa315ddac09866f3a54a1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d8bd788c5904c7a659c1f0617081c73c529020faafa4fecb7ad633b0d62bb433" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a2637ba21978c7d07daa40ac507364499d2e21f05e58bde629e8a35c90bbecbf" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3097+7f7bd206d.tar.xz"
  version "0.11.0-dev.3097+7f7bd206d"
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
