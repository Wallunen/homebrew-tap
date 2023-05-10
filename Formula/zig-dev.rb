class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "fa29a1cf25376db30059b800812e1484141b47a94710e8e56fe443cd20eba498" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4372f8871fe52530e9e6fe2d2921d90422d25773d4488d119fe4197eb8cbd1a7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fa8c3a9c973c014408031c5f6d9982219d54d66854e8f42601215b35a6e4f890" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3045+526065723.tar.xz"
  version "0.11.0-dev.3045+526065723"
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
