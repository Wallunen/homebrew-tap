class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "975a6a7fa2ce2d17f7dba5ab723526153fa2bc7a3625f9d19793fcb0f461d574" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8d10f1dfc89b53dbc14bf18b83dc7b76b4fe40a688cfcf123fbd8a74ff5f143f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c7910e2432c62cfd938238aba890ea8f52fd89880ff9d616bb82b30a68243dce" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.374+742030a8f.tar.xz"
  version "0.12.0-dev.374+742030a8f"
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
