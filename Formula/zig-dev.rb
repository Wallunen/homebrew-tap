class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "bafd53da748bf07cf4b726f0c257bafbcc60e743a07bee2451eff779a5068609" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "710c0fba9cec9869c0403d602a607e90ce9e82bb22659d2f017193d90c2d45fb" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "de7f4b1704135fff9f5126c0c0ebc464fba3ace20a874d2619214ba4cb06f455" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4333+33e4cbb20.tar.xz"
  version "0.11.0-dev.4333+33e4cbb20"
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
