class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "52b858d3fb8e3e71da25ed3b76a91cb3b99d4c326a23dd3fd1fdbf5fdec6fc43" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e98a8acde83881daaddf80c308d7e4f50501c573405844f75468c2fcd1abbb04" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5d52c471c5e987d4eb56ddbd0658b22fa773170c0c2b849fed36c3bf5baa2c2e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1359+e9a00ba7f.tar.xz"
  version "0.14.0-dev.1359+e9a00ba7f"
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
