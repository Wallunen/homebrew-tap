class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f427003fdf8ed819d365e018ecb40b7401b7fc935d4ef4e6db7b3d4d0f9861bf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1f991eca383b5f82da78768f5a5a8138fc98c17c6818b1fcc342aa7eac822a5c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d6053a0677959564417cd3ecd5fb90809ae8dc757f4dbfe70390ebd24b632671" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1710+2bffd8101.tar.xz"
  version "0.12.0-dev.1710+2bffd8101"
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
