class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1dc30ebdb103bb8a689cd9d318dc0312cd6d9caeb7388103ceb07b584e963d9b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3cb9e102773355444fda02b8d3782625e0a78e709f3a462f11d56e273d29063e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "23d23884c086e39aba732e2b6920850f21305274a4f6bc40840538a289fc6590" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1101+25400fadf.tar.xz"
  version "0.12.0-dev.1101+25400fadf"
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
