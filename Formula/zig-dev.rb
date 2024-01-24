class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8635a6435b773ddb16873749e799e5d23d8cd5fb4f614282f6f7d52644cafc8c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2fba585c52e201571b0fce43ac35eee7ed5e6db745c39c62f3e1870d62693535" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "91336a06a8bb5ef3efd423a4c7076477a9d324eda805338a8d78082cb9c97c1d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2334+aef1da163.tar.xz"
  version "0.12.0-dev.2334+aef1da163"
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
