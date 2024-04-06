class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "60c8677aacfa5a07f4c0559e3e375b567296f4a27fd7cf96c53803b282822f42" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0815776257f873a0e3ab4f53c2e5fdd2d0b99371560de3955819b458c8de260a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "13682ef8a058394be714bcf34a36939f1183e179f8815090562960fb1d1022c9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3539+23f729aec.tar.xz"
  version "0.12.0-dev.3539+23f729aec"
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
