class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4f070ed85cb5befab01af31c0fb09da33b751fa3c76af5135c72df6e611eff80" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d1c36ae5540042f08f2e4415c85b4c8b7fee5b299ab692032fc608a4f71f34a6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "252403c9be3d46d03ecad316022c3240191d044d7c881d099d406cc09374466d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3991+3ec337484.tar.xz"
  version "0.11.0-dev.3991+3ec337484"
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
