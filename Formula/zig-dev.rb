class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6ca7082ed325d5700ba320664777d8fd7c77dc3dcb6d01299be98bdd2209e013" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bb009d37117f0141f5a2b179043af790a372aae43d77ac2a854995d05606ed7c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "dc1e3d156de34e53d0cd70c17a5f4a3d3e856742a5635d3113c6eec97bd56594" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1828+225fe6ddb.tar.xz"
  version "0.12.0-dev.1828+225fe6ddb"
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
