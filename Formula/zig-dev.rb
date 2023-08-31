class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "de36e5c6c234f6e50373b0377cf9c399786c46e4b805f9ae20f8ddacd7066d77" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f9f36f8f7dfc3ef7521fc33ce9ada6cc6e8ec4b9f31a695b4445341a29a3d9c1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5f60cee80676d231c9114947f5418859824b2019438256db4d99ad9a68229089" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.186+e2ff486de.tar.xz"
  version "0.12.0-dev.186+e2ff486de"
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
