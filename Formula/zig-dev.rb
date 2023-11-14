class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "421e94d5268208cdcc6a5794dc68745c636f0314f0d3ebd88cabe5bffa443c1b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8bf9fc5408d143c3fd0c242d2081f79bde4562d4b69369db84694f14b0ca24a5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4a752379f0b650dfe1650568610cf4ee4c713bf77b0c44d91e60c63e381636e1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1605+5de063657.tar.xz"
  version "0.12.0-dev.1605+5de063657"
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
